$(document).ready(function() {
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");

    $('#description').trumbowyg({
        lang: 'en',
        fixedBtnPane: false,
        fixedFullWidth: false,
        autogrow: false,
        autogrowOnEnter: false,
        height: 100,
    });

    function populateNotificationTypeDropdown() {
        var notificationTypeSelect = $('#notificationType');
        $.ajax({
            url: '/notification/types',
            method: 'GET',
            success: function(response) {
                notificationTypeSelect.append($('<option></option>')
                    .attr('value', '')
                    .text('- Select Notification Type - ')
                    .prop('disabled', true)
                    .prop('selected', true));

                response.forEach(function(notificationType) {
                    notificationTypeSelect.append($('<option></option>')
                        .val(notificationType.id)
                        .text(notificationType.name));
                });
            },
            error: function() {
                console.error('Error fetching notification types.');
            }
        });
    }

    populateNotificationTypeDropdown();

    $("#save-notification").click(function() {
        var form = $("#addNotificationForm")[0];

        if (form.checkValidity() === false) {
            form.reportValidity();
            return;
        }

        var attachment = $("#attachment")[0].files[0];
        if (attachment) {
            if (attachment.type !== "application/pdf") {
                alert("Please upload a PDF file.");
                return;
            }
            if (attachment.size > 10 * 1024 * 1024) {
                alert("File size must be less than 10MB.");
                return;
            }
        }

        var formData = new FormData($("#addNotificationForm")[0]);
        formData.set('whatsNew', $("#whatsNew").is(":checked") ? "true" : "false");

        $.ajax({
            type: "POST",
            url: "/secure/notification/add",
            data: formData,
            contentType: false,
            processData: false,
            enctype: 'multipart/form-data',
            beforeSend: function(request) {
                request.setRequestHeader(header, token);
            },
            success: function(response) {
                $.confirm({
                    title: 'Success!',
                    content: 'Notification Saved Successfully!',
                    type: 'green',
                    buttons: {
                        ok: function() {
                            window.location.reload();
                        }
                    }
                });
            },
            error: function(error) {
                $.alert({
                    title: 'Error!',
                    content: error.responseText,
                    type: 'red'
                });
            }
        });
    });

    function populateNotificationTable(notificationList) {
        var tableBody = $('#notificationTableBody');
        tableBody.empty();

        $.each(notificationList, function(index, notification) {
            var row = '<tr>' +
                '<td>' + (index + 1) + '</td>' +
                '<td>' + notification.notificationType.name + '</td>' +
                '<td>' + notification.title + '</td>' +
                '<td>' + notification.description + '</td>' +
                '<td>' + notification.uploadDate + '</td>' +
                '<td>' +
                (notification.attachmentName ? '<a class="btn btn-success" href="' + getAttachmentUrl(notification.id) + '" target="_blank" rel="noopener noreferrer">View</a>' : 'No Attachment') +
                '</td>' +
                '<td><button class="btn btn-danger delete-notification" data-notification-id="' + notification.id + '"><i class="fa fa-trash"></i></button></td>' +
                '</tr>';
            tableBody.append(row);
        });
    }

    function getAttachmentUrl(notificationId) {
        return '/notification/attachment/' + notificationId;
    }

    function fetchNotificationData() {
        $.ajax({
            url: '/notification/all',
            method: 'GET',
            success: function(response) {
                populateNotificationTable(response);
            },
            error: function() {
                console.error('Error fetching notification data.');
            }
        });
    }

    fetchNotificationData();

    $('#notificationTableBody').on('click', '.delete-notification', function() {
        var notificationId = $(this).data('notification-id');
        deleteNotification(notificationId);
    });

    function deleteNotification(notificationId) {
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
                            url: '/notifications/delete/' + notificationId,
                            type: 'POST',
                            beforeSend: function(request) {
                                request.setRequestHeader(header, token);
                            },
                            success: function(response) {
                                $.alert({
                                    title: 'Deleted!',
                                    content: 'The notification has been deleted.',
                                    type: 'green'
                                });
                                window.location.reload();
                            },
                            error: function(xhr, status, error) {
                                $.alert({
                                    title: 'Error!',
                                    content: 'Failed to delete the notification. Please try again later.',
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
