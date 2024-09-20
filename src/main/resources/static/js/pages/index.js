$(document).ready(function() {

    function populateNewsDiv(newsList) {
        var newsContainer = $('#newsContainer');
        newsContainer.empty();

        $.each(newsList, function(index, news) {
            var newsDate = new Date(news.uploadDate);
            var formattedDate = newsDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });

            var newsItem = '<div class="mb-3">' +
                '<div class="row">' +
                '<div class="col">' +
                '<h6 class="fw-semibold mb-0 text-secondary">' + news.title + '</h6>' +
                '</div>' +
                '<div class="col text-end">' +
                '<p class="text-muted fs-6 mb-0">' + formattedDate + '</p>' +
                '</div>' +
                '</div>' +
                '<p class="mb-0 mt-1 small"><a href="' + getAttachmentUrlForNews(news.id) + '" target="_blank" class="text-decoration-none text-primary">' + news.description + '</a></p>' +
                '</div> <hr>';

            newsContainer.append(newsItem);
        });


        $('#viewAllButton').attr('href', '/news-events?type=Career');
    }


    function fetchNewsData() {
        $.ajax({
            url: '/news/whatsNew',
            method: 'GET',
            success: function(response) {
                populateNewsDiv(response);
            },
            error: function() {
                console.error('Error fetching whats new.');
            }
        });
    }


    fetchNewsData();


    function populateNotificationDiv(notificationList) {
        var notificationContainer = $('#notificationsContainer');
        notificationContainer.empty();

        $.each(notificationList, function(index, notification) {
            var notificationDate = new Date(notification.uploadDate);
            var formattedDate = notificationDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });

            var notificationItem = '<div class="mb-3">' +
                '<div class="row">' +
                '<div class="col">' +
                '<h6 class="fw-semibold mb-0 text-secondary">' + notification.title + '</h6>' +
                '</div>' +
                '<div class="col text-end">' +
                '<p class="text-muted fs-6 mb-0">' + formattedDate + '</p>' +
                '</div>' +
                '</div>' +
                '<p class="mb-0 mt-1 small"><a href="' + getAttachmentUrlForNotifications(notification.id) + '" target="_blank" class="text-decoration-none text-primary">' + notification.description + '</a></p>' +
                '</div> <hr>';

            notificationContainer.append(notificationItem);
        });


        $('#viewAllButton').attr('href', '/notification-tenders?type=Notification');
    }


    function fetchNotificationData() {
        $.ajax({
            url: '/notifications/whatsNew',
            method: 'GET',
            success: function(response) {
                populateNotificationDiv(response);
            },
            error: function() {
                console.error('Error fetching whats new.');
            }
        });
    }

    $('#myTabs a').on('click', function(event) {
        var tabId = $(this).attr('id');
        if (tabId === 'news-tab') {
            fetchNewsData();
        } else if (tabId === 'notifications-tab') {
            fetchNotificationData();
        }

        var viewAllUrl = (tabId === 'news-tab') ? '/news-events?type=Career' : '/notification-tenders?type=Notification';
        $('#viewAllButton').attr('href', viewAllUrl);
    });
});

function getAttachmentUrlForNews(newsId) {
    return '/news/attachment/' + newsId;
}

function getAttachmentUrlForNotifications(notificationId) {
    return '/notification/attachment/' + notificationId;
}