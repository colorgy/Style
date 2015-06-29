// jQuery navbar scroll effects
$(window).scroll(function() {
  if($('.navbar.auto-expanded')){
    if ($('.navbar.auto-expanded').offset().top > 50 ) {
      $('.navbar.auto-expanded').removeClass('expanded');
    } else {
      $('.navbar.auto-expanded').addClass('expanded');
    }

    if ($('.navbar.auto-transparent').offset().top > 50 ) {
      $('.navbar.auto-transparent').removeClass('transparent');
    } else {
      $('.navbar.auto-transparent').addClass('transparent');
    }
  }
});
