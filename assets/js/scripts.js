/*
    Slider
*/
$(window).load(function() {
    $('.flexslider').flexslider({
        animation: "slide",
        controlNav: "thumbnails"
    });
});


/*
    Filterable portfolio
*/
jQuery(document).ready(function() {
    $clientsHolder = $('ul.portfolio-img');
    $clientsClone = $clientsHolder.clone(); 
 
    $('.filter-portfolio a').click(function(e) {
        e.preventDefault();
        $filterClass = $(this).attr('class');
 
        $('.filter-portfolio a').attr('id', '');
        $(this).attr('id', 'active-imgs');
 
        if($filterClass == 'all'){
            $filters = $clientsClone.find('li');
        }
        else {
            $filters = $clientsClone.find('li[data-type~='+ $filterClass +']');
        }
 
        $clientsHolder.quicksand($filters, {duration: 700}, function() {
            $("a[rel^='prettyPhoto']").prettyPhoto({social_tools: false});
        });
    });
});


/*
    Pretty Photo
*/
jQuery(document).ready(function() {
    $("a[rel^='prettyPhoto']").prettyPhoto({social_tools: false});
    $('.work > img').click(function(){
      $(this).siblings('.icon-awesome').find('a[rel^="prettyPhoto"]').first().click();
      return false;
    });
});

/*
    Contact form
*/
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

