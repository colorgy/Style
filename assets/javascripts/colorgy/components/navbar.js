// jQuery navbar scroll effects
$(window).scroll(function() {
  if ($('.navbar.auto-expanded').offset().top > 50) {
    $('.navbar.auto-expanded').removeClass('expanded');
  } else {
    $('.navbar.auto-expanded').addClass('expanded');
  }

  if ($('.navbar.auto-fade').offset().top > 50) {
    $('.navbar.auto-fade').removeClass('fade');
  } else {
    $('.navbar.auto-fade').addClass('fade');
  }
});
