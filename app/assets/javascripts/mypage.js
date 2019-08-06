$(function() {
  $('.mypage__contents__title').on('click', function() {
    console.log("fire")
    $('.mypage__contents__title').toggleClass('mypage__contents__title--close');
    $('.mypage__announces').toggleClass('mypage--display-none');
    $('.mypage__todos').toggleClass('mypage--display-none');
  });
});
$(function() {
  $('.mypage__purchased__title').on('click', function() {
    console.log("fire")
    $('.mypage__purchased__title').toggleClass('mypage__purchased__title--close');
    $('.mypage__purchased__now').toggleClass('mypage--display-none');
    $('.mypage__purchased__past').toggleClass('mypage--display-none');
  });
});