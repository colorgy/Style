// Example usage: $('.alert.dismissible').getOrAddChild('.close', '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>');

$.fn.getOrAddChild = function (selector, html) {
  var $parents = this;
  $parents.each(function() {
    var $parent = $(this);
    var $child = $parent.children(selector);
    if (!$child.length)
      $child = $(html).appendTo($parent);
    return $child;
  });
};
