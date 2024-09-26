$(document).ready(function() {
        $.ajax({
            url: '/news/viewCategory',
            method: 'GET',
            success: function(response) {
                populateNewsCategories(response);
            },
            error: function() {
                console.error('Error fetching news categories.');
            }
        });


        $('#newsTab').on('click', 'button.nav-link', function (e) {
            e.preventDefault();
            var newsTypeId = $(this).data('news-type-id');
            var containerId = '#' + $(this).attr('aria-controls') + 'Container';
            var newsContainer = $(containerId);
            if (newsContainer.is(':empty')) {
                fetchAndPopulateNews(newsTypeId, containerId);
            }
            $(this).tab('show');
        });

        // Parse the URL parameter to get the selected tab
            var urlParams = new URLSearchParams(window.location.search);
            var selectedTab = urlParams.get('tab');
            if (selectedTab) {
                // Switch to the corresponding tab
                $('#' + selectedTab + '-tab').tab('show');
            }

    });

function populateNewsCategories(newsCategories) {
    var newsTab = $('#newsTab');
    var newsTabContent = $('#newsTabContent');
    $.each(newsCategories, function(index, category) {
        // Add tab
        var tabId = 'newsTab' + category.id;
        var tabName = 'newsTab-' + category.name;
        var tabLink = $('<button class="nav-link" data-bs-toggle="tab" role="tab" aria-controls="' + tabId + '" aria-selected="false"></button>')
            .attr('id', tabName)
            .attr('data-bs-target', '#' + tabId)
            .text(category.name)
            .data('news-type-id', category.id); // Add news type ID as data attribute
        var tabItem = $('<li class="nav-item"></li>').append(tabLink);
        newsTab.append(tabItem);

        // Add tab pane
        var tabPane = $('<div class="tab-pane fade"></div>')
            .attr('id', tabId)
            .attr('role', 'tabpanel')
            .attr('aria-labelledby', tabId + '-tab');
        var tabPaneContainer = $('<div></div>').attr('id', tabId + 'Container');
        tabPane.append(tabPaneContainer);
        newsTabContent.append(tabPane);
    });
    var url = new URL(window.location.href);
    var c = url.searchParams.get("type");
    if(c!=null){
        $('#newsTab-'+c).trigger('click');
    }
}

function fetchAndPopulateNews(newsTypeId, containerId) {
          $.ajax({
            url: '/news/by-type?newsTypeId=' + newsTypeId,
            method: 'GET',
            success: function(response) {
              populateNewsContainer(response, containerId);
            },
            error: function() {
              console.error('Error fetching news data.');
            }
          });
        }


        function populateNewsContainer(newsList, containerId) {
    var newsContainer = $(containerId);
    newsContainer.empty();

    $.each(newsList, function(index, news) {
        var newsDate = new Date(news.uploadDate);
        var formattedDate = newsDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });

        var newsItem = '<div class="mb-3 row align-items-center">' +
                        '<div class="col">' +
                            '<h6 class="fw-semibold mb-0">' +
                                '<span class="fw-bold me-2">' + news.title + '</span>' +
                                '<span class="badge rounded-pill bg-secondary me-2">' + formattedDate + '</span>' +

                            '</h6>' +
                        '</div>';

        if (news.startDate && news.endDate) {
            var startDate = new Date(news.startDate);
            var endDate = new Date(news.endDate);
            var formattedStartDate = startDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });
            var formattedEndDate = endDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });

            newsItem += '<div class="col text-end">' +
                            '<p class="text-muted text-secondary fs-6 mb-0"><b>Start Date: </b>' + formattedStartDate + ' | <b>End Date:</b> ' + formattedEndDate + '</p>' +
                        '</div>';
        } else if (news.startDate) {
            var startDate = new Date(news.startDate);
            var formattedStartDate = startDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });

            newsItem += '<div class="col text-end">' +
                            '<p class="text-muted text-secondary fs-6 mb-0"><b>Start Date:</b>' + formattedStartDate + '</p>' +
                        '</div>';
        } else if (news.endDate) {
            var endDate = new Date(news.endDate);
            var formattedEndDate = endDate.toLocaleDateString('en-US', { day: 'numeric', month: 'long', year: 'numeric' });

            newsItem += '<div class="col text-end">' +
                            '<p class="text-muted text-secondary fs-6 mb-0"><b>End Date:</b>' + formattedEndDate + '</p>' +
                        '</div>';
        }

        newsItem += '</div><div class="col-12"><p class="mb-0 mt-1 small"><a href="' + getAttachmentUrl(news.id) + '" target="_blank" rel="noopener noreferrer" class="text-decoration-none text-primary">' + news.description + '</a></p></div><hr>';
        newsContainer.append(newsItem);
    });
}


        function getAttachmentUrl(newsId) {
                return '/news/attachment/' + newsId;
            }

