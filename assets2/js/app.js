//bizwrap v1.3

/*-----------------------------------------------------------------------------------*/
/*	CONTACT FORM
/*-----------------------------------------------------------------------------------*/ 
$(document).ready(function() {
  var form = $('.contact-form form');

  form.find('input[type=text]').first().focus();

  form.submit(function() {

    var postdata = form.serialize();

    $.ajax({
      type: 'POST',
      url: form.attr('action'),
      data: postdata,
      dataType: 'json'
    }).fail(function(error){
      alert('Error:' + error);
    }).done(function(data){
      window.location = form.data('success');
    });

    return false;
  });
});

$( window ).resize(function() {
  $(".navbar-collapse").css({ maxHeight: $(window).height() - $(".navbar-header").height() + "px" });
});

/* ==============================================
   Sticky Navbar
   =============================================== */

$(document).ready(function() {
  $(".sticky").sticky({topSpacing: 0});

  //search trigger
  $('.icon-search, .search-close').click(function () {
    $('.search-form-nav').animate({height: 'toggle'}, 500);
  });

  $(function() {
    $('.smooth-scroll a[href*="#"]:not([href="#"])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
    });
  });

});

/*=========================*/
/*====main navigation hover dropdown====*/
/*==========================*/
$(document).ready(function() {

  $('.js-activated').dropdownHover({
    instantlyCloseOthers: false,
    delay: 0
  }).dropdown();

});

/*====flex  slider for main slider or testimonials====*/
$('.main-flex-slider,.testimonials').flexslider({
  slideshowSpeed: 5000,
  directionNav: false,
  animation: "fade"
});

/*========portfolio mix====*/
$('#grid').mixitup();

/*========tooltip and popovers====*/

$("[data-toggle=popover]").popover();

$("[data-toggle=tooltip]").tooltip();


/*========flex-gallery slide====*/
$(window).load(function() {
  $('.flexslider').flexslider({
    directionNav: false,
    slideshowSpeed: 3000,
    animation: "fade"
  });
});

/*=========================*/
/*========Animation on scroll with wow.js====*/
/*==========================*/

wow = new WOW(
    {
      animateClass: 'animated',
      offset:       100,
      mobile:       true
    }
    );
wow.init();

/* -------------------
   Parallax Sections
   ---------------------*/
if (!Modernizr.touch) {
  $('.parallax-1').parallax("50%", 0.5);
  $('.page-tree-bg').parallax("50%", 0.5);
}

$(window).load(function() {
  var url = encodeURIComponent(document.location);
  $('.js-facebook').attr('href', 'https://www.facebook.com/sharer/sharer.php?u=' + url);
});
