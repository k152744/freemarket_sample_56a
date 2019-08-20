$(function(){
  function buildHTMLImage(index){
    var html = `<div class="product_exibit__add-card" id = "card-${index}">
                  <div class="product_exibit__add-card__image">
                    <img src = "" id = "img-${index}" title = "">
                  </div>
                  <div class="product_exibit__add-card__btns" >
                    <p>編集</p>
                    <p class = "product_exibit__add-card__btns--delete" data-index = "${index}" >削除</p>
                  </div>
                </div>`
    return html;
  }
  var index = 0
  var defaultwidth = 620
  var delete_array = []
  var maxSize = 5 * 1024 * 1024;
  var image_data = []
  $('#product_image').change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();
    console.log(e.target)
    console.log(e.target.files[0])
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
    if (file.size > maxSize) {
      alert("サイズが大き過ぎますわ。");
      return false;
    }
    reader.onload = (function(file){
      return function(e){
        index += 1
        defaultwidth += -124
        var html = buildHTMLImage(index);
        document.getElementById('width-responce').style.width = defaultwidth + 'px';
        $('.product_exibit--wrap').append(html);
        var id = 'img-' + index
        document.getElementById(id).src = e.target.result;
        document.getElementById(id).title = file.name;
        image_data.push(file)
      };
    })(file);
    reader.readAsDataURL(file);
  });
  // 画像削除
  $(document).on("click", ".product_exibit__add-card__btns--delete", function () {
    var index_number = $(this).data('index') - 1
    $(this).parent().parent().remove();
    delete_array.push(index_number);
    defaultwidth += 124
    document.getElementById('width-responce').style.width = defaultwidth + 'px';
  });
  // ドラッグ&ドロップ
  function handleFileSelect(e) {
    e.stopPropagation();
    e.preventDefault();
    e.currentTarget.classList.remove('dragover')
    var file = e.dataTransfer.files[0]; 
    var reader = new FileReader();
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
    if (file.size > maxSize) {
      alert("サイズが大き過ぎますわ。堪忍な。");
      return false;
    }
    reader.onload = (function(file){
      return function(e){
        index += 1
        defaultwidth += -124
        var html = buildHTMLImage(index);
        document.getElementById('width-responce').style.width = defaultwidth + 'px';
        $('.product_exibit--wrap').append(html);
        var id = 'img-' + index
        document.getElementById(id).src = e.target.result;
        document.getElementById(id).title = file.name;
        // document.getElementById( "product_image" ).value = file;
        // document.getElementById( "new-product" ).value = file;
      };
    })(file);
    reader.readAsDataURL(file);
  }
  function handleDragOver(e) {
    e.stopPropagation();
    e.preventDefault();
    e.dataTransfer.dropEffect = 'copy';
    e.currentTarget.classList.add('dragover');
  }
  function PageLoad(e) {
    var dropFrame = document.getElementById('width-responce');
    dropFrame.addEventListener('dragover', handleDragOver, false);
    dropFrame.addEventListener('drop', handleFileSelect, false);
    dropFrame.addEventListener('dragleave', function () {
      dropFrame.classList.remove('dragover');
    });
  }
  if(document.URL.match("products/new")){
    window.onload = PageLoad();
  }

  // 出品後
  $('#new-product').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    formData.append('product[image][]',image_data );
    for(item of formData) console.log(item);
    console.log(url)
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(product){
      $(".exhibit-modal").fadeIn();
      var html = `<a class="exhibit-modal__content__link" href="/products/${product.id}"><p>商品ページへ行ってシェアする</p></a>`
      $('.exhibit-modal__content').append(html);
    })
    .fail(function(){
      alert('error');
    })
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
    var html = buildTax(tax);
    $('.product_exibit__form__middle__text__right').append(html);
    var income_origin = input - tax_origin
    var income = "¥ " + String(income_origin).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    if (income == "¥ NaN") {income = ""}
    var incomehtml = buildTax(income);
    $('.product_exibit__form__bottom__text__right').append(incomehtml);
  });
})

// 購入後
$(function(){
  $('a.item-detail__buybtn--sold').click(function(){
    return false;
  })
});