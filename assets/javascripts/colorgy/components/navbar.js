// jQuery navbar scroll effects
$(window).scroll(function() {
  if ($(window).scrollTop() > 50 ) {
    $('.navbar.auto-expanded').removeClass('expanded');
    $('.navbar.auto-transparent').removeClass('transparent');
  } else {
    $('.navbar.auto-expanded').addClass('expanded');
    $('.navbar.auto-transparent').addClass('transparent');
  }
});
