var ready = function() {

 $('.toggle-menu0').on('click touchstart', function() {
		$('.topbar-wrap').toggle('slow');
	});

	$('.toggle-menu1').on('click touchstart', function() {
		$('.topbar-wrap').toggle('slow');
	});

};

$(document).ready(ready);
$(document).on('page:load', ready);