// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



	(function($) {

		skel.breakpoints({
			wide: '(max-width: 1680px)',
			normal: '(max-width: 1280px)',
			narrow: '(max-width: 980px)',
			narrower: '(max-width: 840px)',
			mobile: '(max-width: 736px)',
			mobilep: '(max-width: 480px)'
		});

		$(function() {

			var	$window = $(window),
				$body = $('body'),
				$header = $('#header'),
				$banner = $('#banner');

			// Fix: Placeholder polyfill.
				$('form').placeholder();

			// Prioritize "important" elements on narrower.
				skel.on('+narrower -narrower', function() {
					$.prioritize(
						'.important\\28 narrower\\29',
						skel.breakpoint('narrower').active
					);
				});

			// Dropdowns.
				$('#nav > ul').dropotron({
					alignment: 'right',
					expandMode: 'click'
				});
				// console.log($('#nav > ul'));

			// Off-Canvas Navigation.

				// Navigation Button.
					$(
						'<div id="navButton">' +
							'<a href="#navPanel" class="toggle"></a>' +
						'</div>'
					)
						.appendTo($body);

				// Navigation Panel.
					$(
						'<div id="navPanel">' +
							'<nav>' +
								$('#nav').navList() +
							'</nav>' +
						'</div>'
					)
						.appendTo($body)
						.panel({
							delay: 500,
							hideOnClick: true,
							hideOnSwipe: true,
							resetScroll: true,
							resetForms: true,
							side: 'left',
							target: $body,
							visibleClass: 'navPanel-visible'
						});

				// Fix: Remove navPanel transitions on WP<10 (poor/buggy performance).
					if (skel.vars.os == 'wp' && skel.vars.osVersion < 10)
						$('#navButton, #navPanel, #page-wrapper')
							.css('transition', 'none');

			// Header.
			// If the header is using "alt" styling and #banner is present, use scrollwatch
			// to revert it back to normal styling once the user scrolls past the banner.
			// Note: This is disabled on mobile devices.
				if (!skel.vars.mobile
				&&	$header.hasClass('alt')
				&&	$banner.length > 0) {

					$window.on('load', function() {

						$banner.scrollwatch({
							delay:		0,
							range:		0.5,
							anchor:		'top',
							on:			function() { $header.addClass('alt reveal'); },
							off:		function() { $header.removeClass('alt'); }
						});

					});

				}

		});

	})(jQuery);
