// ブランド：インクリメンタルサーチ


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
      console.log(categories);
      alert('yeah');
      $("product_middle_category_id").fadeIn(0);
      categories.forEach(function(category){
        var html = buildOption(category)
        console.log($("product_middle_category_id"))
        console.log(category)
        console.log(select_number)
        $("product_middle_category_id").append(html)
      })
      // return categories;
    })
    .fail(function(){
      alert('error');
      return false
    })
  }
  $("#product_big_category_id").change(function(e){
    var id = $(this).val()
    var select_number = 0
    sendData(id, select_number)
  })
});

// 手数料計算
$(function(){
  function buildTax(money){
    var html = `<p>${money}</p>`
    return html
  }
  $("#product_price").on("input",function() {
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