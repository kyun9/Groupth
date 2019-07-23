$(document).ready(function() {

	//defining our variables in the root of the code and updating those variables every time we scroll
	var windowHeight = $(window).height();
	var windowScrollPosTop = $(window).scrollTop();
	var windowScrollPosBot = windowHeight + windowScrollPosTop;

	// so the red extends to the bottom of the browser window
	if ($(window).height() > 510) {
		$("#top_block").css("height", $(window).height());
	};


	// this is how you make a jQuery plugin/method   $.fn.nameOfPlugin
	$.fn.revealOnScroll = function(direction) {
		return this.each(function() {

			var objectOffset = $(this).offset();
			var objectOffsetTop = objectOffset.top;

			if (!$(this).hasClass('hidden')) {
				if (direction == "top") {
					$(this).css({
						"opacity"	: 0,
						"top" 	:"20px"
					});
				} else if(direction == "bottom") {
					$(this).css({
						"opacity"	: 0,
						"top" 	:"-20px"
					});
				}
				$(this).addClass("hidden");
			}


			if (!$(this).hasClass("animation-complete")) {

				if (windowScrollPosBot > objectOffsetTop) {
					$(this).animate({
						"opacity"	: 1,
						"top"		: 0},
						1000).addClass("animation-complete");
				}
			}

		});
	}




	$(window).scroll(function() {
		windowHeight = $(window).height();
		windowScrollPosTop = $(window).scrollTop();
		windowScrollPosBot = windowHeight + windowScrollPosTop;

		$(".effect").revealOnScroll("top");

		$(".member_description").revealOnScroll();

	});


});