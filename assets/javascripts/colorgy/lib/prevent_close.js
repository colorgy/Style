preventClose = {

  preventCount: 0,

  prevent: function(message) {
    this.preventCount += 1;
    if (!message) message = 'Are you sure you want to leave?';
    window.onbeforeunload = function(){
       return message;
    };
  },

  preventEnd: function(message) {
    this.preventCount -= 1;
    if (this.preventCount === 0) {
      window.onbeforeunload = null;
    }
  },

  allow: function() {
    window.onbeforeunload = null;
  }
};
