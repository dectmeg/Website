$(document).ready(function() {
            // Function to fetch gallery events and populate cards
            function fetchGalleryEvents() {
                $.ajax({
                    url: '/gallery-events/all',
                    method: 'GET',
                    success: function(events) {
                        populateGallery(events);
                    },
                    error: function() {
                        console.error('Error fetching gallery events.');
                    }
                });
            }

            // Function to populate gallery cards with event data
function populateGallery(events) {
    const galleryContainer = $('#galleryContainer');
    galleryContainer.empty();

    events.forEach(event => {
        const card = $('<div>').addClass('col-md-4 mb-4');
        const cardInner = $('<div>').addClass('card gallery-card');

        const thumbnailUrl = `/gallery-events/${event.id}/first-image`;
        const thumbnail = $('<img>').attr('src', thumbnailUrl).addClass('card-img-top').attr('alt', event.title);

        // Dynamically set the href attribute of the link to include the event ID
        const viewImagesLink = $('<a>').attr('href', `/view_images?event_id=${event.id}`).addClass('btn btn-primary').text('View Images');

        const cardBody = $('<div>').addClass('card-body')
            .append($('<h5>').addClass('card-title').text(event.title))
            .append($('<p>').addClass('card-text').text(event.description))
            .append(viewImagesLink); // Append the link to the card body

        cardInner.append(thumbnail);
        cardInner.append(cardBody);
        card.append(cardInner);
        galleryContainer.append(card);
    });
}

            fetchGalleryEvents();
        });