$(document).on('turbolinks:load ajaxSuccess', function() {

	$(".alert-danger, .alert-success").delay(4000).fadeOut(1500); //Fading of alerts

	$('.zoom').elevateZoom({
			zoomWindowFadeIn: 500,
			zoomWindowFadeOut: 500,
			lensFadeIn: 500,
			lensFadeOut: 500,
            zoomWindowWidth:450,
            zoomWindowHeight:450,
            scrollZoom:true
	});

	refreshRating();

});

var refreshRating = function() {
	$('.rating').raty({ path: '/assets', scoreName: 'comment[rating]' }); //rating plugin
	$('.rated').raty({ path: '/assets',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	});
};

