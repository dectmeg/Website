$(document).ready(function() {
            // Function to retrieve event ID from URL parameter
            function getEventIdFromURL() {
                const urlParams = new URLSearchParams(window.location.search);
                return urlParams.get('event_id');
            }

            // Function to fetch event details including the title
            function fetchEventDetails() {
                const eventId = getEventIdFromURL();
                if (eventId) {
                    $.ajax({
                        url: `/gallery-events/${eventId}`,
                        method: 'GET',
                        success: function(event) {
                            $('#eventTitle').text(event.title);
                        },
                        error: function() {
                            console.error('Error fetching event details.');
                        }
                    });
                } else {
                    console.error('Event ID not found in URL.');
                }
            }

            // Function to fetch all images associated with the event
            function fetchEventImages() {
                const eventId = getEventIdFromURL();
                if (eventId) {
                    $.ajax({
                        url: `/gallery-events/${eventId}/images`,
                        method: 'GET',
                        success: function(images) {
                            populateThumbnails(images);
                            bindFancyBox(); // Bind FancyBox after populating thumbnails
                        },
                        error: function() {
                            console.error('Error fetching event images.');
                        }
                    });
                } else {
                    console.error('Event ID not found in URL.');
                }
            }

            // Function to populate thumbnails on the page
            function populateThumbnails(images) {
                const imageContainer = $('#imageContainer');
                imageContainer.empty();

                images.forEach(image => {
                    const imgElement = $('<a>')
                        .attr('href', `data:image/jpeg;base64,${image}`)
                        .attr('data-fancybox', 'gallery')
                        .append($('<img>').attr('src', `data:image/jpeg;base64,${image}`).addClass('thumbnail'));
                    imageContainer.append(imgElement);
                });
            }

            // Function to bind FancyBox to the images
            function bindFancyBox() {
                Fancybox.bind('[data-fancybox="gallery"]', {
                    //
                });
            }

            // Fetch event details and images on page load
            fetchEventDetails();
            fetchEventImages();
        });