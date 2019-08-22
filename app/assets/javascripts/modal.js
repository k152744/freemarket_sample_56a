$(function(){

  $(".del").on('click',function(e){
        e.preventDefault();
        $('.modal').fadeIn();
        return false;
      });
      $(".cancel-btn").on('click',function(e){
        e.preventDefault();
        $('.modal').fadeOut();
        return false;
      });
});
