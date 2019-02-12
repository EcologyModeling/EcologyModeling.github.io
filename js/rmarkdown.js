var RMD = {};

(function() {


  RMD.AppViewModel = function() {
    var self = this;

    self.handleWindowScroll = function(event) {
      var scrollPos = $(event.target).scrollTop();
      if (scrollPos > 20) {
        $('#rStudioHeader').addClass("shrunk");
      }
      else {
        $('#rStudioHeader').removeClass("shrunk");
      }
    }

    var menuShowing = false;
    self.handleMenuTogglerClick = function(event) {
      menuShowing = !menuShowing;
      if (menuShowing) {
        $('#menuItems').addClass("showMenu");
      }
      else {
        $('#menuItems').removeClass("showMenu");
      }

    }

    self.init = function() {
      $(window).on('scroll', self.handleWindowScroll);
      $('#menuToggler').on('click', self.handleMenuTogglerClick);
    }
  }


}());

$(document).ready(function() {

  $chunks = $('.fold');

  $chunks.each(function () {

    // add button to source code chunks
    if ( $(this).hasClass('s') ) {
      $('pre.r', this).prepend("<div class=\"showopt\">Открыть исходный код</div><br style=\"line-height:22px;\"/>");
      $('pre.r', this).children('code').attr('class', 'folded');
    }

    // add button to output chunks
    if ( $(this).hasClass('o') ) {
      $('pre:not(.r)', this).has('code').prepend("<div class=\"showopt\">Открыть результат</div><br style=\"line-height:22px;\"/>");
      $('pre:not(.r)', this).children('code:not(r)').addClass('folded');

      // add button to plots
      $(this).find('img').wrap('<pre class=\"plot\"></pre>');
      $('pre.plot', this).prepend("<div class=\"showopt\">Открыть график</div><br style=\"line-height:22px;\"/>");
      $('pre.plot', this).children('img').addClass('folded');

    }
  });

  // hide all chunks when document is loaded
  $('.folded').css('display', 'none')

  // function to toggle the visibility
  $('.showopt').click(function() {
    var label = $(this).html();
    if (label.indexOf("Show") >= 0) {
      $(this).html(label.replace("Открыть ", "Скрыть "));
    } else {
      $(this).html(label.replace("Скрыть ", "Открыть "));
    }
    $(this).siblings('code, img').slideToggle('fast', 'swing');
  });

  RMD.app = new RMD.AppViewModel();
  RMD.app.init();
});