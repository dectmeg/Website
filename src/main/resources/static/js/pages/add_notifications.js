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
                    if (attachment && attachment.type !== "application/pdf") {
                        alert("Please upload a PDF file.");
                        return;
                    }


        var title = $("#title").val();
        var description = $("#description").val();
        var startDate = $("#startDate").val();
        var endDate = $("#enddate").val();
        var attachment = $("#attachment")[0].files[0];
        var newsType = $('#newsType option:selected').val();
        var whatsNew = $("#whatsNew").is(":checked");

        var formData = new FormData($("#addNotificationForm")[0]);
        formData.set('whatsNew', whatsNew ? "true" : "false");

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
                Swal.fire({
                    icon: 'success',
                    title: 'News Saved Successfully!',
                    confirmButtonText: 'OK'
                                        }).then((result) => {

                                            if (result.isConfirmed || result.dismiss === Swal.DismissReason.backdrop) {
                                                window.location.reload();
                                            }
                                        });
                                    },
            error: function(error) {
                console.error('Error adding news:', error.responseText);
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: 'Failed to save news. Please try again.',
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
                (notification.attachmentName ? '<a class="btn btn-success" href="' + getAttachmentUrl(notification.id) + '" target="_blank">View</a>' : 'No Attachment') +
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
});

function deleteNotification(notificationId) {
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");


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

            $.ajax({
                url: '/notifications/delete/' + notificationId,
                type: 'POST',
                beforeSend: function(request) {

                    request.setRequestHeader(header, token);
                },
                success: function(response) {

                    Swal.fire({
                        title: 'Deleted!',
                        text: 'The news item has been deleted.',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then((result) => {

                        if (result.isConfirmed || result.dismiss === Swal.DismissReason.backdrop) {
                            window.location.reload();
                        }
                    });
                },
                error: function(xhr, status, error) {

                    Swal.fire({
                        title: 'Error!',
                        text: 'Failed to delete the news item. Please try again later.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                }
            });
        }
    });
}
