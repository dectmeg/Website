$(document).ready(function() {
        $.ajax({
            url: '/notification/types',
            method: 'GET',
            success: function(response) {
                populateNotificationCategories(response);
            },
            error: function() {
                console.error('Error fetching notification categories.');
            }
        });


        $('#notificationTab').on('click', 'button.nav-link', function (e) {
            e.preventDefault();
            var notificationTypeId = $(this).data('notification-type-id');
            var containerId = '#' + $(this).attr('aria-controls') + 'Container';
            var notificationContainer = $(containerId);
            if (notificationContainer.is(':empty')) {
                fetchAndPopulateNotifications(notificationTypeId, containerId);
            }
            $(this).tab('show');
        });

        var urlParams = new URLSearchParams(window.location.search);
                    var selectedTab = urlParams.get('tab');
                    if (selectedTab) {

                        $('#' + selectedTab + '-tab').tab('show');
                    }
    });

function populateNotificationCategories(notificationCategories) {
    var notificationTab = $('#notificationTab');
    var notificationTabContent = $('#notificationTabContent');
    $.each(notificationCategories, function(index, category) {
        // Add tab
        var tabId = 'notificationTab' + category.id;
        var tabName = 'notificationTab-' + category.name;
        var tabLink = $('<button class="nav-link" data-bs-toggle="tab" role="tab" aria-controls="' + tabId + '" aria-selected="false"></button>')
            .attr('id', tabName)
            .attr('data-bs-target', '#' + tabId)
            .text(category.name)
            .data('notification-type-id', category.id);
        var tabItem = $('<li class="nav-item"></li>').append(tabLink);
        notificationTab.append(tabItem);

        // Add tab pane
        var tabPane = $('<div class="tab-pane fade"></div>')
            .attr('id', tabId)
            .attr('role', 'tabpanel')
            .attr('aria-labelledby', tabId + '-tab');
        var tabPaneContainer = $('<div></div>').attr('id', tabId + 'Container');
        tabPane.append(tabPaneContainer);
        notificationTabContent.append(tabPane);
    });
    var url = new URL(window.location.href);
    var c = url.searchParams.get("type");
    if(c!=null){
        $('#notificationTab-'+c).trigger('click');
    }

}

function fetchAndPopulateNotifications(notificationTypeId, containerId) {
          $.ajax({
            url: '/notifications/by-type?notificationTypeId=' + notificationTypeId,
            method: 'GET',
            success: function(response) {
              populateNotificationContainer(response, containerId);
            },
            error: function() {
              console.error('Error fetching notification data.');
            }
          });
        }


        function populateNotificationContainer(notificationList, containerId) {
    var notificationContainer = $(containerId);
    notificationContainer.empty();

    $.each(notificationList, function(index, notification) {
        var notificationDate = new Date(notification.uploadDate);
        var formattedDate = notificationDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });

        var notificationItem = '<div class="mb-3 row align-items-center">' +
                        '<div class="col">' +
                            '<h6 class="fw-semibold mb-0">' +
                                '<span class="fw-bold me-2"><a href="' + getAttachmentUrl(notification.id) + '" target="_blank" rel="noopener noreferrer" class="text-decoration-none text-primary">' + notification.title + '</a></span>' +
                                '<span class="badge rounded-pill bg-secondary me-2">' + formattedDate + '</span>' +

                            '</h6>' +
                        '</div>';

        if (notification.startDate && notification.endDate) {
            var startDate = new Date(notification.startDate);
            var endDate = new Date(notification.endDate);
            var formattedStartDate = startDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });
            var formattedEndDate = endDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });

            notificationItem += '<div class="col text-end">' +
                            '<p class="text-muted text-secondary fs-6 mb-0"><b>Start Date: </b>' + formattedStartDate + ' | <b>End Date:</b> ' + formattedEndDate + '</p>' +
                        '</div>';
        } else if (notification.startDate) {
            var startDate = new Date(notification.startDate);
            var formattedStartDate = startDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });

            notificationItem += '<div class="col text-end">' +
                            '<p class="text-muted text-secondary fs-6 mb-0"><b>Start Date:</b>' + formattedStartDate + '</p>' +
                        '</div>';
        } else if (notification.endDate) {
            var endDate = new Date(notification.endDate);
            var formattedEndDate = endDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });

            notificationItem += '<div class="col text-end">' +
                            '<p class="text-muted text-secondary fs-6 mb-0"><b>End Date:</b>' + formattedEndDate + '</p>' +
                        '</div>';
        }

        notificationItem += '</div><div class="col-12"><p class="mb-0 mt-1 small">' + notification.description + '</p></div><hr>';
        notificationContainer.append(notificationItem);
    });
}


        function getAttachmentUrl(notificationId) {
                return '/notification/attachment/' + notificationId;
            }