// Flash messages adopter
//
// API: flash.info(message, actions, title);
//            ^
//            can be info, success, error or warning
//
// The "actions" parameter can be a string of HTML, or an array containing
// title and callbacks like this:
// [['Cancel', function() { alert('Canceled!'); }], ['Details'] function() { alert('Yo!'); }]
//
//= require ../vendor/toastr

flash = {};

flash.count = 0;
flash.onShown = function() {
  flash.count++;
  var $toast = flash.hideFirstToast();
  setTimeout(function() {
    $toast.css({
      'margin-top': '0',
      '-moz-transition-property': 'margin, margin-top',
      '-o-transition-property': 'margin, margin-top',
      '-webkit-transition-property': 'margin, margin-top',
      'transition-property': 'margin, margin-top',
      '-moz-transition-duration': '0.3s',
      '-o-transition-duration': '0.3s',
      '-webkit-transition-duration': '0.3s',
      'transition-duration': '0.3s'
    });
  }, 10);
};

flash.hideFirstToast = function() {
  var $target = $('#toast-container .toast:first-of-type');
  var tHight = $target.outerHeight(true);
  $target.css({
    'margin-top': '-' + (tHight) + 'px',
    '-moz-transition-property': 'none',
    '-o-transition-property': 'none',
    '-webkit-transition-property': 'none',
    'transition-property': 'none',
    '-moz-transition-duration': '0',
    '-o-transition-duration': '0',
    '-webkit-transition-duration': '0',
    'transition-duration': '0'
  });
  return $target;
};

toastr.options = {
  "closeButton": false,
  "debug": false,
  "newestOnTop": true,
  "progressBar": false,
  "positionClass": "toast-top-center",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": 0,
  "hideDuration": 1000,
  "timeOut": 5000,
  "extendedTimeOut": 800,
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut",
  "onShown": flash.onShown
};

flash.info = function(message, actions, title) {
  toastr.info(message, title, { 'actions': actions });
};

flash.success = function(message, actions, title) {
  toastr.success(message, title, { 'actions': actions });
};

flash.error = function(message, actions, title) {
  toastr.error(message, title, { 'actions': actions });
};

flash.warning = function(message, actions, title) {
  toastr.warning(message, title, { 'actions': actions });
};

window.flash = flash;
