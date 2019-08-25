// メッセージ
$(function(){
  $('.comments__form__text__stamp-btn').on('click', function() {
    $(".comments__stamps").toggleClass('comments__stamps--open');
  });
  $(".comments__stamps__stamp").on('click', function(){
    var product = $(this).data('product')
    var stamp = $(this).data('stamp')
    $.ajax({
      url: ("/comments/stamp"),
      type: "GET",
      data: {product: product , stamp: stamp},
      dataType: 'json',
    })
    .done(function(comment){
      var id = "stamp-" + stamp
      var src = document.getElementById(id).src
      var html = `<a class="comments__comment__user-info comments__comment__user-info--current_user" href="/"><img class="comments__comment__user-info__image comments__comment__user-info__image--current_user" src="/assets/no-image-b902c35d8aa1b5ab4b19b1fe237e51d97ae045c93b919e948bfbd9457907169c.jpg">
                    <div class="comments__comment__user-info__name comments__comment__user-info__name--current_user">
                      <h2>${comment.name}</h2>
                    </div>
                  </a>
                  <div class="comments__comment__stamp--wrap comments__comment__stamp--wrap--current_user">
                    <div class="comments__comment__contents__past">
                      <i class="fas fa-clock comments__comment__contents__past--icon"></i>
                      <p>${comment.past}</p>
                    </div>
                    <div class="comments__comment__stamp comments__comment__stamp--current_user">
                      <img src=${src}>
                    </div>
                  </div>`
      $(".comments__comment").append(html);
      $('.comments__comment').animate({ scrollTop: $('.comments__comment')[0].scrollHeight},1000,'swing');
    })
    .fail(function(){
    })
  });
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    var product = $(".comments__form__submit").data('product')
    formData.append('product',product )
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    
    .done(function(comment){
      var html = `<a class="comments__comment__user-info comments__comment__user-info--current_user" href="#"><img class="comments__comment__user-info__image comments__comment__user-info__image--current_user" src="/assets/no-image-b902c35d8aa1b5ab4b19b1fe237e51d97ae045c93b919e948bfbd9457907169c.jpg">
                    <div class="comments__comment__user-info__name comments__comment__user-info__name--current_user">
                      <h2>${comment.name}</h2>
                    </div>
                  </a>
                  <div class="comments__comment__contents comments__comment__contents--current_user">
                    <div class="comments__comment__contents__text">
                      <p>${comment.context}</p>
                    <div class="comments__comment__contents__past">
                      <i class="fas fa-clock comments__comment__contents__past--icon"></i>
                      <p>${comment.past}</p>
                      </div>
                    </div>
                  </div>`;
      $('.comments__comment').append(html)
      $("#new_comment")[0].reset();
      $('.comments__form__submit').removeAttr('disabled');
      $('.comments__comment').animate({ scrollTop: $('.comments__comment')[0].scrollHeight},1000,'swing');
    })
    .fail(function(){
      $("#new_comment")[0].reset();
      $('.comments__form__submit').removeAttr('disabled');
      $('.comments__comment').animate({ scrollTop: $('.comments__comment')[0].scrollHeight},1000,'swing');
    })
  })
})
