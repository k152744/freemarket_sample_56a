$(function () {
  $(".category-btn__clear").on("click", function () {
      clearForm(this.form);
  });

  function clearForm (form) {
      $(form)
          .find("input, select, textarea")
          .not(":button, :submit, :reset, :hidden")
          .val("")
          .prop("checked", false)
          .prop("selected", false)
      ;
  }
  
});
$(function(){
  $("#status-all").on("click",function(){
    $(".status-checkbox").prop('checked', this.checked);
  })
})
$(function(){
  $("#delivary-fee-all").on("click",function(){
    $(".delivary-fee-checkbox").prop('checked', this.checked);
  })
})
$(function(){
  $("#listing_status-all").on("click",function(){
    $(".listing_status-checkbox").prop('checked', this.checked);
  })
})

$(function() {
  function buildHTML(middlecategory){
      var html = `
                  <option data-big-id = "${middlecategory.id}" value="${middlecategory.name}">${middlecategory.name} </option>`

      return html;
  };
 
  //セレクトボックスが切り替わったら発動
  $('.side-bar__box__btn__change').change(function() {
    $(".side-bar__box__btn__select").empty();
    $(".side-bar__box__btn__select").slideDown(0);
    //選択したvalue値を変数に格納
    var bigcategory = $(this).val();

    $.ajax({
      url: "/products/category",
      type: "GET",
      data: {keyword: bigcategory},
      dataType: "json",
    })
    .done(function(middlecategories){
      var addHTML = '';
      middlecategories.forEach(function(middlecategory){
      addHTML = buildHTML(middlecategory); 
      $('.side-bar__box__btn__select').append(addHTML);
      

      })
      
      
    })
    .fail(function(){
      alert('error');
    });

    
 
    
  });

  function buildsmall(smallcategory){
    var html = `<div class="side-bar__box__groups__form__checkboxs__label">
                  <input type="checkbox" value="${smallcategory.name}" name="q[small_category_name_cont]" id="q_small_category_name_cont">
                  <label class="side-bar__box__groups__form--label" for="q_${smallcategory.name}">${smallcategory.name}</label>
                </div>`

    return html;
  };
  

  $('.side-bar__box__btn__select').change(function() {
    $(".side-bar__box__groups__form__checkboxs__hidden").empty();
    $(".side-bar__box__groups__form__checkboxs__hidden").slideDown(0);
    //選択したvalue値を変数に格納
    var middle = $(this).val();
    var bigId =  $(this).children().data("big-id");

    $.ajax({
      url: "/products/category_middle",
      type: "GET",
      data: {keyword: middle,id: bigId},
      dataType: "json",
    })
    .done(function(smallcategories){
      var addHTML = '';
      smallcategories.forEach(function(smallcategory){
      addHTML = buildsmall(smallcategory); 
      $('.side-bar__box__groups__form__checkboxs__hidden').append(addHTML);
        
  
      })
      
    })
    .fail(function(){
      alert('error');
    });  
  });
  
});

