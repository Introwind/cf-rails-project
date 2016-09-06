$(document).on('turbolinks:load', function() {

	$(".alert-danger, .alert-success").delay(3500).fadeOut(1500);

	$('.rating').raty({ path: '/assets', scoreName: 'comment[rating]' });
	$('.rated').raty({ path: '/assets',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	});

});