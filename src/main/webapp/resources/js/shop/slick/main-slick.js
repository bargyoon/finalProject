$(document).ready(function(){
	$('.slick_test').slick({
        infinite : true,
        slidesToShow : 6,
        slidesToScroll : 1,
        speed : 100,
        arrows : true,
        autoplay : true,
        autoplaySpeed : 4000,
        pauseOnHover : true,
        vertical : false,
        prevArrow : "<button type='button' class='slick-prev'><i class='fas fa-chevron-left'></i></button>",
        nextArrow : "<button type='button' class='slick-next'><i class='fas fa-chevron-right'></i></button>",
        draggable : true,
        
        //반응형
        responsive: [
            {  
                breakpoint: 1400,
                settings: {
                    slidesToShow:5 
                } 
            },
            {  
                breakpoint: 1196,
                settings: {
                    slidesToShow:4 
                } 
            },
            {  
                breakpoint: 960,
                settings: {
                    slidesToShow:3 
                } 
            },
            { 
                breakpoint: 768,
                settings: {
                    slidesToShow:2 
                } 
            }
        ]
	});

    $('.slick_test2').slick({
        infinite : true,
        slidesToShow : 1,
        slidesToScroll : 1,
        speed : 100,
        arrows : false,
        autoplay : true,
        autoplaySpeed : 3000,
        pauseOnHover : true,
        vertical : false,
        draggable : true,
	});
	
});
