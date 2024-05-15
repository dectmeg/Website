$(document).ready(function() {
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");

    // Function to populate the news type dropdown
    function populateNewsTypeDropdown() {
        var newsTypeSelect = $('#newsType');

        // Make an AJAX request to fetch the news types
        $.ajax({
            url: '/news/types',
            method: 'GET',
            success: function(response) {
                // Add the default option (disabled and selected)
                newsTypeSelect.append($('<option></option>')
                    .attr('value', '')
                    .text('- Select News Type - ')
                    .prop('disabled', true)
                    .prop('selected', true));

                // Add the news types from the response
                response.forEach(function(newsType) {
                    newsTypeSelect.append($('<option></option>')
                        .val(newsType.id)
                        .text(newsType.name));
                });
            },
            error: function() {
                console.error('Error fetching news types.');
            }
        });
    }

    // Call the function to populate the dropdown
    populateNewsTypeDropdown();

    $("#save-news").click(function() {
        var title = $("#title").val();
        var description = $("#description").val();
        var startDate = $("#startDate").val();
        var endDate = $("#enddate").val();
        var attachment = $("#attachment")[0].files[0];
        var newsType = $('#newsType option:selected').val();
        var whatsNew = $("#whatsNew").is(":checked");

        var formData = new FormData($("#addNewsForm")[0]);

        formData.set('whatsNew', whatsNew ? "true" : "false");

        $.ajax({
            type: "POST",
            url: "/secure/news/add",
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
                    showConfirmButton: false,
                    timer: 1500
                });

                setTimeout(function() {
                    window.location.href = '/secure/news';
                }, 2000);
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

    $('#description').trumbowyg({
        lang: 'en',
        fixedBtnPane: false,
        fixedFullWidth: false,
        autogrow: false,
        autogrowOnEnter: false,
        height: 100,
    });

    // Function to populate the table with news data
    function populateNewsTable(newsList) {
        var tableBody = $('#newsTableBody');
        tableBody.empty(); // Clear existing rows

        $.each(newsList, function(index, news) {
            var row = '<tr>' +
                '<td>' + (index + 1) + '</td>' +
                '<td>' + news.newsType.name + '</td>' +
                '<td>' + news.title + '</td>' +
                '<td>' + news.description + '</td>' +
                '<td>' + news.uploadDate + '</td>' +
                '<td>' +
                    (news.attachmentName ? '<a class="btn btn-success" href="' + getAttachmentUrl(news.id) + '" target="_blank">View</a>' : 'No Attachment') +
                '</td>' +
                '<td><button class="btn btn-danger delete-news" data-news-id="' + news.id + '"><i class="fa fa-trash"></i></button></td>' +
            '</tr>';
            tableBody.append(row);
        });
    }

    function getAttachmentUrl(newsId) {
        return '/news/attachment/' + newsId;
    }

    function fetchNewsData() {
        $.ajax({
            url: '/news/all',
            method: 'GET',
            success: function(response) {
                populateNewsTable(response);
            },
            error: function() {
                console.error('Error fetching news data.');
            }
        });
    }

    fetchNewsData();

    // Attach event listener to handle delete action
    $('#newsTableBody').on('click', '.delete-news', function() {
        var newsId = $(this).data('news-id');
        deleteNews(newsId);
    });
});


function deleteNews(newsId) {
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");

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
                url: '/news/delete/' + newsId,
                type: 'POST',
                beforeSend: function(request) {
                    request.setRequestHeader(header, token);
                },
                success: function(response) {
                    // Show a success dialog if the delete operation is successful
                    Swal.fire({
                        title: 'Deleted!',
                        text: 'The news item has been deleted.',
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
                        text: 'Failed to delete the news item. Please try again later.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                }
            });
        }
    });

}
