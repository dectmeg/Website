        $(document).ready(function() {
            fetchAndPopulateNews('#allNewsContainer');
        });

        function fetchAndPopulateNews(containerId) {
            $.ajax({
                url: '/news/all',
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
                                        '<span class="badge rounded-pill bg-secondary me-2">' + formattedDate + '</span>' +
                                        '<span class="badge rounded-pill bg-secondary me-2">' + news.title + '</span>' +
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
