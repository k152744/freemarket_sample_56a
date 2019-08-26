// カテゴリー登録
$(function(){
  function buildOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`
    return html;
  }
  function sendData(id, select_number){
    $.ajax({
      url: ("/categories/search"),
      type: "GET",
      data: {id: id, select_number: select_number},
      dataType: 'json',
    })
    .done(function(categories){
      if(select_number === 0){
        $("#product_middle_category_id").fadeIn(0);
        $("#product_middle_category_id").empty();
        $("#product_middle_category_id").append(`<option>---</option>`)
        categories.forEach(function(category){
          var html = buildOption(category)
          $("#product_middle_category_id").append(html);
        });
      }else{
        $("#product_small_category_id").fadeIn(0);
        $("#product_small_category_id").empty();
        $("#product_small_category_id").append(`<option>---</option>`)
        categories.forEach(function(category){
          var html = buildOption(category)
          $("#product_small_category_id").append(html);
        });
      }
    })
    .fail(function(){
      alert("表示失敗")
      return false
    })
  }
  $("#product_big_category_id").change(function(e){
    var id = $(this).val()
    var select_number = 0
    sendData(id, select_number)
    $("#product_small_category_id").fadeOut(0);
    $("#product_small_category_id").empty();
  })
  $("#product_middle_category_id").change(function(e){
    var id = $(this).val()
    var select_number = 1
    sendData(id, select_number)
  })
  if(document.URL.match("products/new")){
    $("#product_middle_category_id").addClass("category--nodisplay");
    $("#product_small_category_id").addClass("category--nodisplay");
  }
});

// ブランド：インクリメンタルサーチ
$(function(){
  function BuildBrands(brand){
    var html = `<div class="product_exibit__form__search-result__brands" data-id="${brand.id}" data-name="${brand.name}">
                  <p>${brand.name}</p>
                </div>`
    return html;
  }
  $("#product_search_fake").on("input",function(){
    var keyword = $(this).val();
    $(".product_exibit__form__search-result").empty();
    if(keyword != ""){
      $.ajax({
        url: ("/products/brand_incremental"),
        type: "GET",
        data: {keyword: keyword},
        dataType: 'json',
      })
      .done(function(brands){
        brands.forEach(function(brand){
          var html = BuildBrands(brand)
          $(".product_exibit__form__search-result").append(html);
        })
      })
      .fail(function(){
        alert("検索失敗")
        return false
      })
      $(document).on("click",".product_exibit__form__search-result__brands",function(){
        $(".product_exibit__form__search-result").empty();
        document.getElementById("product_search_fake").value = $(this).data("name")
        document.getElementById("product_brand_id").value = $(this).data("id")
      })
    }
  });
  if(document.URL.match("edit") && document.URL.match("products")){
    document.getElementById("product_search_fake").value = $("#fake_name").val()
  }
});

// 手数料計算
$(function(){
  function buildTax(money){
    var html = `<p>${money}</p>`
    return html
  }
  $("#product_price").on("input",function(){
    $(".product_exibit__form__middle__text__right").empty();
    $(".product_exibit__form__bottom__text__right").empty();
    var input = $(this).val();
    var tax_origin = Math.floor(input * 0.1);
    var tax = "¥ " + String(tax_origin).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    if (tax == "¥ NaN") {tax = "数字にしてくれ"}
    if (tax_origin < 30 ) {tax = "-"}
    var html = buildTax(tax);
    $('.product_exibit__form__middle__text__right').append(html);
    var income_origin = input - tax_origin
    var income = "¥ " + String(income_origin).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    if (income == "¥ NaN") {income = ""}
    if (income_origin < 270) {income = "-"}
    if (input == 19950505) {income = "Keita HappyBirthDay!!"}
    if (input == 19931210) {income = "Kyotaka HappyBirthDay!!"}
    if (input == 19901117) {income = "Naoyuki HappyBirthDay!!"}
    if (input == 19911208) {income = "Yasuki HappyBirthDay!!"}
    var incomehtml = buildTax(income);
    $('.product_exibit__form__bottom__text__right').append(incomehtml);
  });
})