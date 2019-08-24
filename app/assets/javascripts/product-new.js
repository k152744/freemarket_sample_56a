// 出品画像
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
  function fileReader(file){
    var reader = new FileReader();
      reader.onload = (function(file){
        return function(e){
          if(defaultwidth_second === 0){
            alert("画像の数半端ないって！こんなん処理できひんやん、普通");
            return false;
          }
          index += 1
          defaultwidth += -124
          defaultwidth_second += -124
          var html = buildHTMLImage(index);
          $('.product_exibit--wrap').append(html);
          var id = 'img-' + index
          document.getElementById(id).src = e.target.result;
          document.getElementById(id).title = file.name;
          image_data.push(file)
          document.getElementById('width-responce').style.width = defaultwidth + 'px';
          document.getElementById('width-responce-second').style.width = defaultwidth_second + 'px';
          if(defaultwidth == 0){
            $('#width-responce-second').fadeIn(0);
            $('#width-responce').fadeOut(0);
          }
          if(defaultwidth_second === 0){
            $('#width-responce-second').css({
              "border":"none"
            });
          }
        };
      })(file);
    reader.readAsDataURL(file);    
  }
  var index = 0
  var defaultwidth = 620
  var defaultwidth_second = 1240
  var image_data = []
  var delete_array = []
  var maxSize = 5 * 1024 * 1024;
  // 選択で出品
  $('#product_image').change(function(e){
    for(var i=0;i<e.target.files.length;i++){
      var file = e.target.files[i];
      if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
      }
      if (file.size > maxSize) {
        alert("サイズが大き過ぎますわ。");
        return false;
      }
      fileReader(file)
    }
  });
  // 画像削除
  $(document).on("click", ".product_exibit__add-card__btns--delete", function () {
    var index_number = $(this).data('index') - 1
    $(this).parent().parent().remove();
    delete_array.push(index_number);
    defaultwidth += 124
    defaultwidth_second += 124
    document.getElementById('width-responce').style.width = defaultwidth + 'px';
    document.getElementById('width-responce-second').style.width = defaultwidth_second + 'px';
    if(defaultwidth > 0){
      $('#width-responce-second').fadeOut(0);
      $('#width-responce').fadeIn(0);
    }
    if(defaultwidth_second > 0){
      $('#width-responce-second').css({
        "border":" 1px dashed #ccc"
      });
    }
  });
  // ドラッグ&ドロップ
  function handleFileSelect(e) {
    e.stopPropagation();
    e.preventDefault();
    e.currentTarget.classList.remove('dragover')
    for(var i=0;i<e.dataTransfer.files.length;i++){
      var file = e.dataTransfer.files[i]; 
      if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
      }
      if (file.size > maxSize) {
        alert("サイズが大き過ぎますわ。堪忍な。");
        return false;
      }
      fileReader(file)
    }
  }
  function handleDragOver(e) {
    e.stopPropagation();
    e.preventDefault();
    e.dataTransfer.dropEffect = 'copy';
    e.currentTarget.classList.add('dragover');
  }
  function PageLoad(e) {
    var dropFrame = document.getElementById('width-responce');
    var dropFrame_second = document.getElementById('width-responce-second');
    dropFrame.addEventListener('dragover', handleDragOver, false);
    dropFrame.addEventListener('drop', handleFileSelect, false);
    dropFrame.addEventListener('dragleave', function () {
      dropFrame.classList.remove('dragover');
    });
    dropFrame_second.addEventListener('dragover', handleDragOver, false);
    dropFrame_second.addEventListener('drop', handleFileSelect, false);
    dropFrame_second.addEventListener('dragleave', function () {
      dropFrame_second.classList.remove('dragover');
    });
  }
  if((document.URL.match("edit") && document.URL.match("products")) || document.URL.match("products/new")){
    window.onload = PageLoad();
  }
  // 出品
  if(document.URL.match("products/new")){
    $('#new-product').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      delete_array.forEach(function(index){
        delete image_data[index]
      })
      formData.delete( 'product[image][]' ) ;
      image_data.forEach(function(image){
        formData.append('product[image][]',image );
      })
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
        $('.user-btn').removeAttr('disabled');
      })
    })
  }
});

// 購入後
$(function(){
  $('a.item-detail__buybtn--sold').click(function(){
    return false;
  })
});