$(document).ready(function() {
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

        // Get CSRF token from the meta tags
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajax({
            type: "POST",
            url: "/secure/key-contacts/add",
            data: JSON.stringify(data),
            contentType: "application/json",
            beforeSend: function(request) {
                // Include CSRF token in the request header
                request.setRequestHeader(header, token);
            },
            success: function(response) {
                // Show success message using Swal.fire
                Swal.fire({
                    title: 'Contact Added!',
                    text: 'The contact has been added successfully.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    // Reload the page after the user clicks "OK"
                    if (result.isConfirmed || result.dismiss === Swal.DismissReason.backdrop) {
                        window.location.reload();
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error("Failed to add contact:", error);
                // Handle error response here
            }
        });
    });

    function populateContactsTable(contactsList) {
        var tableBody = $('#contactsTableBody');
        tableBody.empty(); // Clear existing rows

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

    // Attach event listener to handle delete action
    $('#contactsTableBody').on('click', '.delete-contact', function() {
        var contactId = $(this).data('contact-id');
        deleteContact(contactId);
    });
});

function deleteContact(contactId) {
    // Get CSRF token from the meta tags
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    // Show a confirmation dialog before proceeding with the delete operation
    Swal.fire({
        title: 'Are you sure?',
        text: 'You won\'t be able to revert this!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            // If the user confirms, proceed with the delete operation
            $.ajax({
                url: '/key-contacts/delete/' + contactId,
                type: 'POST',
                beforeSend: function(request) {
                    // Include CSRF token in the request header
                    request.setRequestHeader(header, token);
                },
                success: function(response) {
                    // Show a success dialog if the delete operation is successful
                    Swal.fire({
                        title: 'Deleted!',
                        text: 'The contact has been deleted.',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        // Reload the page after the user clicks "OK"
                        if (result.isConfirmed || result.dismiss === Swal.DismissReason.backdrop) {
                            window.location.reload();
                        }
                    });
                },
                error: function(xhr, status, error) {
                    // Show an error dialog if there's an issue with the delete operation
                    Swal.fire({
                        title: 'Error!',
                        text: 'Failed to delete contact. Please try again later.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                }
            });
        }
    });
}
