$(function (){

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
    

  $("#dropdowu-menus--open").mouseover(function(){
    $("#dropdowu-menus__menu").slideDown(0);
  })
  $("#dropdowu-menus--open").mouseout(function(){
    $("#dropdowu-menus__menu").slideUp(0);
  })
  $(".dropdowu-menus--big").mouseover(function(){
    $(".dropdowu-menus__menu--middle").slideUp(0);
    $(".dropdowu-menus__menu--small").slideUp(0);
    $(this).next().slideDown(0);
  })
  $(".dropdowu-menus--middle").mouseover(function(){
    $(".dropdowu-menus__menu--small").slideUp(0);
    $(this).next().slideDown(0);
  })
  $(".dropdowu-menus__menu--middle").mouseover(function(){
    $(this).prev().toggleClass("dropdowu-menus--big--active");
  })
  $(".dropdowu-menus__menu--middle").mouseout(function(){
    $(this).prev().toggleClass("dropdowu-menus--big--active");
  })
  $(".dropdowu-menus__menu--small").mouseover(function(){
    $(this).prev().toggleClass("dropdowu-menus--middle--active");
  })
  $(".dropdowu-menus__menu--small").mouseout(function(){
    $(this).prev().toggleClass("dropdowu-menus--middle--active");
  })
  $("#dropdowu-brands--open").mouseover(function(){
    $("#dropdowu-brands__menu").slideDown(0);
  })
  $("#dropdowu-brands--open").mouseout(function(){
    $("#dropdowu-brands__menu").slideUp(0);
  })
});
