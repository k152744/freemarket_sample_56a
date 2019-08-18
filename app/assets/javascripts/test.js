$(function (){
  if(document.URL.match("edit")){
    $(".exhibit-btn")
      .animate({
        'top':'85%',
        'left':'0',
        'duration': 300,
        'easing': 'linear'
      },2000)
      .animate({
        'top':'0',
        'left':'10%',
        'duration': 300,
        'easing': "swing"
      },2000)
      .animate({
        'top':'30%',
        'left':'85%',
        'duration': 300,
        'easing': "swing"
      },2000)
      .animate({
        'top':'85%',
        'left':'40%',
        'duration': 300,
        'easing': 'linear'
      },2000)
      .animate({
        'top':'20%',
        'left':'0',
        'duration': 300,
        'easing': "swing"
      },2000)
      .animate({
        'top':'0',
        'left':'30%',
        'duration': 300,
        'easing': 'linear'
      },2000)
      .animate({
        'top':'80%',
        'left':'85%',
        'duration': 300,
        'easing': "swing"
      },2000)
     ;
    }
});
$(function (){
  if(document.URL.match("edit")){}else{
    (function($){
      $.fn.tinyDraggable = function(options){
          var settings = $.extend({ handle: 0, exclude: 0 }, options);
          return this.each(function(){
              var dx, dy, el = $(this), handle = settings.handle ? $(settings.handle, el) : el;
              handle.on({
                  mousedown: function(e){
                      if (settings.exclude && ~$.inArray(e.target, $(settings.exclude, el))) return;
                      e.preventDefault();
                      var os = el.offset(); dx = e.pageX-os.left, dy = e.pageY-os.top;
                      $(document).on('mousemove.drag', function(e){ el.offset({top: e.pageY-dy, left: e.pageX-dx}); });
                  },
                  mouseup: function(e){ $(document).off('mousemove.drag'); }
              });
          });
      }
    }(jQuery));
    var element = $('.exhibit-btn')
    var flag = 0;
          element.on("mousedown", function(){
              flag = 0;
          });
          element.on("mousemove", function(){
              flag = 1;
          });
          element.on("mouseup", function(){
              if(flag === 0){
                element.unbind('click').click()
              }
              else if(flag === 1){
                element.click(function(){
                  event.preventDefault();
                })
              }
          });
    element.tinyDraggable();
  };
});