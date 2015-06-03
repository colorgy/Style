//= require colorgy/addons/holder
//= require ./styleguide/kss
//= require ./styleguide/prism

$(document).on('ready page:load', function () {
  Prism.highlightAll();
  $('.styleguide-example a[href="#"]').click(function (e) {
    e.preventDefault();
  });
});
