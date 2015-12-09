/*-----------------------------------------------------------------------------------*/
/*	CONTACT FORM
/*-----------------------------------------------------------------------------------*/ 
jQuery(document).ready(function() {
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

/*-----------------------------------------------------------------------------------*/
/*	SLIDER
/*-----------------------------------------------------------------------------------*/ 

jQuery(document).ready(function() {
				
				if (jQuery.fn.cssOriginal!=undefined)
					jQuery.fn.css = jQuery.fn.cssOriginal;

					jQuery('.fullwidthbanner').revolution(
						{	
							delay:5000,												
							startwidth:1280,
							startheight:700,
							hideThumbs:200,
							onHoverStop:"off",						// Stop Banner Timet at Hover on Slide on/off
							navigationType:"none",					//bullet, thumb, none, both	 (No Shadow in Fullwidth Version !)
							touchenabled:"on",						// Enable Swipe Function : on/off
							fullWidth:"on"
							
						});	
			});

/*-----------------------------------------------------------------------------------*/
/*	TOGGLE
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function() {
	//Hide the tooglebox when page load
	jQuery(".togglebox").hide();
	//slide up and down when click over heading 2
	jQuery("h4").click(function() {
		// slide toggle effect set to slow you can set it to fast too.
		jQuery(this).toggleClass("active").next(".togglebox").slideToggle("slow");
		return true;
	});
});

/*-----------------------------------------------------------------------------------*/
/*	TABS
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function() {
	jQuery('.tab-container').easytabs({
		animationSpeed: 300,
		updateHash: false
	});
});

/*-----------------------------------------------------------------------------------*/
/*	FORM
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function() {
	jQuery('form input[type=text]').first().focus();
});

/*-----------------------------------------------------------------------------------*/
/*	PORTFOLIO GRID
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function() {
	var jQuerycontainer = jQuery('#portfolio .items');
	jQuerycontainer.imagesLoaded(function() {
		jQuerycontainer.isotope({
			itemSelector: '.item',
			layoutMode: 'fitRows'
		});
	});
	jQuery('.filter li a').click(function() {
		jQuery('.filter li a').removeClass('active');
		jQuery(this).addClass('active');
		var selector = jQuery(this).attr('data-filter');
		jQuerycontainer.isotope({
			filter: selector
		});
		return false;
	});
});

/*-----------------------------------------------------------------------------------*/
/*	IMAGE HOVER
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function() {
	jQuery('.items li a, .item a, .featured a').prepend('<span class="more"></span>');
});
jQuery(document).ready(function() {
	jQuery('.item, .items li, .featured').mouseenter(function(e) {
		jQuery(this).children('a').children('span').fadeIn(300);
	}).mouseleave(function(e) {
		jQuery(this).children('a').children('span').fadeOut(200);
	});
});

/*-----------------------------------------------------------------------------------*/
/*	BUTTON HOVER
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function(jQuery) {
	jQuery(".social li a").css("opacity", "1.0");
	jQuery(".social li a").hover(function() {
		jQuery(this).stop().animate({
			opacity: 0.75
		}, "fast");
	}, function() {
		jQuery(this).stop().animate({
			opacity: 1.0
		}, "fast");
	});
});

/*-----------------------------------------------------------------------------------*/
/*	VIDEO
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function() {
	jQuery('.media, .featured').fitVids();
});

/*-----------------------------------------------------------------------------------*/
/*	SELECTNAV
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function() {
	selectnav('tiny', {
		label: '--- Navigation --- ',
		indent: '-'
	});
});

/*-----------------------------------------------------------------------------------*/
/*	MENU
/*-----------------------------------------------------------------------------------*/
ddsmoothmenu.init({
	mainmenuid: "menu",
	orientation: 'h',
	classname: 'menu',
	contentsource: "markup"
})

/*-----------------------------------------------------------------------------------*/
/*	HTML5 Media Resize
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function(){
	jQuery(window).resize(function() {
			initMediaResize();
	});
	initMediaResize();
});

function initMediaResize() {
	jQuery('.tb-resizemedia').each(function() {
		var media=jQuery(this);
		var iframe=media.find('iframe:first');
		var flv=media.find('.video-wrapper .video-container a');
		//alert(jQuery(this).width()+"  "+jQuery(this).data('width'));
		var prop= media.width() / media.data('width');
		if (iframe.length>0) iframe.height(media.data('height')*prop);
		if (flv.length>0) flv.height(media.data('height')*prop);
	});
}
