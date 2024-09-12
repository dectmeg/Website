$(document).ready(function() {
    $("#contactsTableBody").sortable();
    $("#contactsTableBody").disableSelection();

    $("#save-contact").click(function() {
        var name = $("#nameAndDesignation").val();
        var office = $("#office").val();
        var mobile = $("#mobile").val();
        var email = $("#email").val();

        var data = {
            nameAndDesignation: name,
            officeNumber: office,
            mobileNumber: mobile,
            email: email
        };

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajax({
            type: "POST",
            url: "/secure/key-contacts/add",
            data: JSON.stringify(data),
            contentType: "application/json",
            beforeSend: function(request) {
                request.setRequestHeader(header, token);
            },
            success: function(response) {
                $.confirm({
                    title: 'Contact Added!',
                    content: 'The contact has been added successfully.',
                    type: 'green',
                    buttons: {
                        ok: function() {
                            window.location.reload();
                        }
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error("Failed to add contact:", error);
                $.alert({
                    title: 'Error!',
                    content: 'Failed to add contact. Please try again later.',
                    type: 'red'
                });
            }
        });
    });

    function populateContactsTable(contactsList) {
        var tableBody = $('#contactsTableBody');
        tableBody.empty();

        $.each(contactsList, function(index, contacts) {
            var row = '<tr>' +
                '<td>' + (index + 1) + '</td>' +
                '<td>' + contacts.nameAndDesignation + '</td>' +
                '<td>' + contacts.officeNumber + '</td>' +
                '<td>' + contacts.mobileNumber + '</td>' +
                '<td>' + contacts.email + '</td>' +
                '<td><button class="btn btn-danger delete-contact" data-contact-id="' + contacts.id + '"><i class="fa fa-trash"></i></button></td>' +
            '</tr>';
            tableBody.append(row);
        });
    }

    function fetchContactsData() {
        $.ajax({
            url: '/key-contacts/all',
            method: 'GET',
            success: function(response) {
                populateContactsTable(response);
            },
            error: function() {
                console.error('Error fetching contacts.');
            }
        });
    }

    fetchContactsData();

    $('#contactsTableBody').on('click', '.delete-contact', function() {
        var contactId = $(this).data('contact-id');
        deleteContact(contactId);
    });

    $("#saveOrder").click(function() {
        var order = [];
        $("#contactsTableBody tr").each(function(index, element) {
            var contactId = $(element).find(".delete-contact").data("contact-id");
            order.push({
                id: contactId,
                order: index + 1
            });
        });

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajax({
            type: "POST",
            url: "/secure/key-contacts/reorder",
            data: JSON.stringify(order),
            contentType: "application/json",
            beforeSend: function(request) {
                request.setRequestHeader(header, token);
            },
            success: function(response) {
                $.confirm({
                    title: 'Order Saved!',
                    content: 'The new order has been saved successfully.',
                    type: 'green',
                    buttons: {
                        ok: function() {
                            window.location.reload();
                        }
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error("Failed to save order:", error);
                $.alert({
                    title: 'Error!',
                    content: 'Failed to save order. Please try again later.',
                    type: 'red'
                });
            }
        });
    });

    function deleteContact(contactId) {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.confirm({
            title: 'Are you sure?',
            content: 'You won\'t be able to revert this!',
            type: 'red',
            buttons: {
                confirm: {
                    text: 'Yes, delete it!',
                    btnClass: 'btn-red',
                    action: function() {
                        $.ajax({
                            url: '/key-contacts/delete/' + contactId,
                            type: 'POST',
                            beforeSend: function(request) {
                                request.setRequestHeader(header, token);
                            },
                            success: function(response) {
                                $.alert({
                                    title: 'Deleted!',
                                    content: 'The contact has been deleted.',
                                    type: 'green'
                                });
                                window.location.reload();
                            },
                            error: function(xhr, status, error) {
                                $.alert({
                                    title: 'Error!',
                                    content: 'Failed to delete contact. Please try again later.',
                                    type: 'red'
                                });
                            }
                        });
                    }
                },
                cancel: function() {
                    // Do nothing
                }
            }
        });
    }
});
