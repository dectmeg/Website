function openEditEventModal(event) {
            var eventId = $(event.currentTarget).data('event-id');
            var title = $(event.currentTarget).data('title');
            var description = $(event.currentTarget).data('description');
            var eventDate = $(event.currentTarget).data('event-date');

            // Populate modal fields with event details
            $('#eventId').val(eventId);
            $('#editTitle').val(title);

            // Open the modal
            $('#editEventModal').modal('show');

            // Fetch event images and populate modal with image previews
            $.ajax({
                url: '/gallery-events/' + eventId + '/images',
                method: 'GET',
                success: function(images) {
                    var imagePreviews = $('#editImagePreviews');
                    imagePreviews.empty(); // Clear previous previews

                    // Append image previews to the modal
                    var row;
                    images.forEach(function(image, index) {
                        if (index % 2 === 0) { // Start a new row for every two images
                            row = $('<div class="row"></div>');
                            imagePreviews.append(row);
                        }

                        // Create thumbnail for the image
                        var img = $('<img src="data:image/jpeg;base64,' + image + '" class="img-thumbnail col-sm-6 mb-2">'); // Added 'col-sm-6' class for half width on small screens
                        row.append(img);
                    });
                },
                error: function() {
                    console.error('Error fetching event images.');
                }
            });
        }

        // Attach click event listener to edit buttons
        $(document).on('click', '.edit-btn', openEditEventModal);

        $(document).ready(function() {

                    const token = $("meta[name='_csrf']").attr("content");
                    const header = $("meta[name='_csrf_header']").attr("content");


                    // Function to display image previews
                    function previewImages(event) {
                        var files = event.target.files;

                        // Clear previous previews
                        $("#imagePreviews").empty();

                        for (var i = 0; i < files.length; i++) {
                            var reader = new FileReader();

                            reader.onload = function (event) {
                                var imgSrc = event.target.result;
                                var previewHtml = '<div class="position-relative d-inline-block me-2">' +
                                    '<img src="' + imgSrc + '" class="img-thumbnail" style="max-width: 100px; max-height: 100px;" />' +
                                    '</div>';

                                $("#imagePreviews").append(previewHtml);
                            };

                            reader.readAsDataURL(files[i]);
                        }
                    }

                    // Event listener for file input change
                    $("#images").change(function(event) {
                        previewImages(event);
                    });

                    // Function to handle form submission
                    $("#save-news").click(function() {
                        var formData = new FormData($("#addGalleryEventForm")[0]);

                        // AJAX request to submit the form
                        $.ajax({
                            type: "POST",
                            url: "/secure/gallery-events/add",
                            data: formData,
                            contentType: false,
                            processData: false,
                            beforeSend: function(request) {
                                                        // Include CSRF token in the request header
                                                        request.setRequestHeader(header, token);
                                                    },
                            success: function(response) {
                                // Show success message with SweetAlert
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Gallery Event Saved Successfully!',
                                    showConfirmButton: false,
                                    timer: 1500
                                });

                                // Redirect to news page after a delay
                                setTimeout(function() {
                                    window.location.href = '/secure/add-photos';
                                }, 2000);
                            },
                            error: function(error) {
                                // Show error message with SweetAlert
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Error!',
                                    text: 'Failed to save gallery event. Please try again.',
                                });
                                console.error('Error adding gallery event:', error.responseText);
                            }
                        });
                    });

                    function populateGalleryEventsTable(galleryEventsList) {
                                    var tableBody = $('#eventsTableBody');
                                    tableBody.empty(); // Clear existing rows

                                    $.each(galleryEventsList, function(index, galleryEvent) {
                        var row = '<tr>' +
                            '<td>' + (index + 1) + '</td>' +
                            '<td>' + galleryEvent.title + '</td>' +
                            '<td>' + galleryEvent.description + '</td>' +
                            '<td>' + galleryEvent.eventDate + '</td>' +
                            '<td>' +
                            '<button class="btn btn-primary edit-btn" ' +
                            'data-event-id="' + galleryEvent.id + '" ' +
                            'data-title="' + galleryEvent.title + '" ' +
                            'data-description="' + galleryEvent.description + '" ' +
                            'data-event-date="' + galleryEvent.eventDate + '">Edit</button>' +
                            '</td>' +
                            '</tr>';
                        tableBody.append(row);
                    });
                                }

                                function fetchGalleryEventsData() {
                                    $.ajax({
                                        url: '/gallery-events/all',
                                        method: 'GET',
                                        success: function(response) {
                                            populateGalleryEventsTable(response);
                                        },
                                        error: function() {
                                            console.error('Error fetching gallery events data.');
                                        }
                                    });
                                }
                                fetchGalleryEventsData();
                });