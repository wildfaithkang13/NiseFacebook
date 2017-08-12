// <script type="text/javascript">
//
$(function($) {

	var nav    = $('.nav'),
   		offset = nav.offset();

	$(window).scroll(function () {
 		 if($(window).scrollTop() > offset.top) {
  		  nav.addClass('fixed');
 		 } else {
  		  nav.removeClass('fixed');
 		 }
	});
});

//
// </script>
