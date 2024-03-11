new Swiper('.clients-slider', {
        speed: 400,
        loop: true,
        autoplay: {
            delay: 2000,
            disableOnInteraction: false
        },
        slidesPerView: 'auto',
        breakpoints: {
            320: {
                slidesPerView: 2,
                spaceBetween: 40
            },
            480: {
                slidesPerView: 3,
                spaceBetween: 60
            },
            640: {
                slidesPerView: 4,
                spaceBetween: 80
            },
            992: {
                slidesPerView: 6,
                spaceBetween: 110
            }
        }
    });

    var onResize = function () {
            // apply dynamic padding at the top of the body according to the fixed navbar height
            $("body").css("padding-top", ($(".fixed-top").height() + 50));
        };

        // attach the function to the window resize event
        $(window).resize(onResize);

        // call it also when the page is ready after load or reload
        $(function () {
            onResize();
        });

        $(document).ready(function(){
              $(".openModalLink").click(function(e){
                e.preventDefault();
                var link = $(this).attr("href");
                $("#proceedButton").attr("href", link);
              });
            });