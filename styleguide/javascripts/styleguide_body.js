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

  // Collapse html block on code examples
  $('.styleguide-example').append('<div class="styleguide-example-show-code-toggle">Show Code</div>');
  $('.styleguide-example-show-code-toggle').click(function (e) {
    $toggle = $(e.target);
    $htmlBlock = $toggle.parent().find('.styleguide-html');
    $htmlBlock.collapse('toggle');
    if ($toggle.html() == 'Show Code') {
      $toggle.html('Hide Code');
    } else {
      $toggle.html('Show Code');
    }
  });

  $('.styleguide-html').addClass('collapse');
});
