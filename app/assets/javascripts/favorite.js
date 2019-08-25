$(function() {
  

  function replaceHtml(favorite_lenght,add_class,add_icon){
      var html = `<a class="item-detail__buttons--heart ${add_class}" href="">
                    <i class="${add_icon} fa-{:class=>&quot;&quot;}"></i>
                    <span>いいね!</span>
                    <span>${favorite_lenght}</span>
                  </a>`
      return html;

  }
  $(document).on("click",".item-detail__buttons--heart",function(e){
    e.preventDefault();
    var Id =  $(this).parent().data("product-id");
    if ($('.heart-btn-on').length){
      
      url = "/products/favorite_delete"
      

    }else{
      
      url = "/products/favorite_create"
    }



    $.ajax({
      url: url,
      type: "GET",
      data: {product_id: Id},
      dataType: "json",
    })
    .done(function(favorite_lenght){

      if ($('.heart-btn-on').length){
        add_class = ""
        add_icon  = "far fa-heart"
      }else{
        add_class = "heart-btn-on"
        add_icon =  "fas fa-heart"
      }
      $(".item-detail__buttons--heart").replaceWith(replaceHtml(favorite_lenght,add_class,add_icon));
      
    })
    .fail(function(){
      alert('error');
    });



  







  })
});