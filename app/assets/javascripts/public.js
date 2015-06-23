var width = window.innerWidth,
    height = window.innerHeight;

$(function(){
	$('.menu').menu().css({
		"font-size" : '21px',
		"width" : "230px",
		"margin": "auto",
		"padding": "20px 5px 20px 5px"
	})
	$('.menu:text').css({
		"padding-top": "20px"
	})
	$('.content').css({
		"height":height
	})
	$('#sidebar').css({
		"height":"100%"
	})

	// $('.footer').css({width: width});
});

