$(function (){

  $(".exhibit-btn").animate({'right':'1300px'},2000);
  $(".exhibit-btn").animate({'left':'1100px'},2000);

  $("#dropdowu-menus").mouseover(function(){
    $("#dropdowu-menus__menu").slideDown();
  })
  $("#dropdowu-menus").mouseout(function(){
    $("#dropdowu-menus__menu").slideUp();
  })

  $("#dropdowu-brands").mouseover(function(){
    $("#dropdowu-brands__menu").slideDown();
  })
  $("#dropdowu-brands").mouseout(function(){
    $("#dropdowu-brands__menu").slideUp();
  })
});
