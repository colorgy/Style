//= require ../lib/interactiveStyle
//= require ../lib/jquery.getOrAddChild

interactiveStyle.alert = function() {
  $('.alert.dismissible').getOrAddChild('.close', '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>');
  //= require bootstrap/alert
}

interactiveStyle.alert();
