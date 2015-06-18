//= require vendor/holder
//= require ./styleguide/kss
//= require ./styleguide/prism

$(document).on('ready page:load', function () {
  Prism.highlightAll();

  $('.styleguide-example a[href="#"]').click(function (e) {
    e.preventDefault();
  });

  $('a.navbar-brand').click(function (e) {
    if ($(window).scrollTop() < 1) {
      if (!window.index) { window.location = '../' };
    }
  });
});
