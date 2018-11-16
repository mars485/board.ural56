!function ($) { 
$(function(){

$('body').tooltip({
      selector: "[data-toggle=tooltip]",
      container: "body"
    });

$(".dropdown").hover(
        function() { $('.dropdown-menu', this).fadeIn("fast");
        },
        function() { $('.dropdown-menu', this).fadeOut("fast");
    });

$('.alert').alert();

$('body').popover({
      selector: "[data-toggle=popover]",
      container: "body"
    });
$('#RegionModal').modal('hide');

$('#quote-carousel').carousel({
    pauseOnHover: true,
    interval: 1000,
  });
})
}(window.jQuery)

