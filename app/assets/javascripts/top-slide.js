$(function() {
  $('.slider').slick({
      prevArrow:'<i class="fas fa-chevron-left slide-arrow-left"></i>',
      nextArrow:'<i class="fas fa-chevron-right slide-arrow-right"></i>',
      dots: true,
      autoplay: true,
      autoplaySpeed: 4000,
      speed: 800 ,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});