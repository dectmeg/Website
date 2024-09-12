$(document).ready(function() {
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");

    function populateNewsTypeDropdown() {
        var newsTypeSelect = $('#newsType');

        $.ajax({
            url: '/news/types',
            method: 'GET',
            success: function(response) {
                newsTypeSelect.append($('<option></option>')
                    .attr('value', '')
                    .text('- Select News Type - ')
                    .prop('disabled', true)
                    .prop('selected', true));

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

    populateNewsTypeDropdown();

    $("#save-news").click(function() {
        var form = $("#addNewsForm")[0];

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

        var formData = new FormData($("#addNewsForm")[0]);
        formData.set('whatsNew', $("#whatsNew").is(":checked") ? "true" : "false");

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
                $.confirm({
                    title: 'Success!',
                    content: 'News Saved Successfully!',
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

    $('#description').trumbowyg({
        lang: 'en',
        fixedBtnPane: false,
        fixedFullWidth: false,
        autogrow: false,
        autogrowOnEnter: false,
        height: 100,
    });

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
                    (news.attachmentName ? '<a class="btn btn-success" href="' + getAttachmentUrl(news.id) + '" target="_blank" rel="noopener noreferrer">View</a>' : 'No Attachment') +
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

    $('#newsTableBody').on('click', '.delete-news', function() {
        var newsId = $(this).data('news-id');
        deleteNews(newsId);
    });

    function deleteNews(newsId) {
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
                            url: '/news/delete/' + newsId,
                            type: 'POST',
                            beforeSend: function(request) {
                                request.setRequestHeader(header, token);
                            },
                            success: function(response) {
                                $.alert({
                                    title: 'Deleted!',
                                    content: 'The news item has been deleted.',
                                    type: 'green'
                                });
                                window.location.reload();
                            },
                            error: function(xhr, status, error) {
                                $.alert({
                                    title: 'Error!',
                                    content: 'Failed to delete the news item. Please try again later.',
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
