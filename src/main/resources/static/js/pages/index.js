$(document).ready(function() {
    // Function to populate news data
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

        // Set "View All" button URL for news
        $('#viewAllButton').attr('href', '/news-events?type=Career');
    }

    // Function to fetch news data
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

    // Fetch news data on page load
    fetchNewsData();

    // Function to populate notification data
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

        // Set "View All" button URL for notifications
        $('#viewAllButton').attr('href', '/notification-tenders?type=Notification');
    }

    // Function to fetch notification data
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

    // Handle tab click event
    $('#myTabs a').on('click', function(event) {
        var tabId = $(this).attr('id');
        if (tabId === 'news-tab') {
            fetchNewsData();
        } else if (tabId === 'notifications-tab') {
            fetchNotificationData();
        }

        // Set "View All" button URL based on the active tab
        var viewAllUrl = (tabId === 'news-tab') ? '/news-events?type=Career' : '/notification-tenders?type=Notification';
        $('#viewAllButton').attr('href', viewAllUrl);
    });
});

function getAttachmentUrlForNews(newsId) {
    return '/news/attachment/' + newsId;
}

// Function to get the attachment URL for notifications
function getAttachmentUrlForNotifications(notificationId) {
    return '/notification/attachment/' + notificationId;
}