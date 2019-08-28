// 出品画像
$(function(){
  function buildHTMLImage(index){
    var html = `<div class="product_exibit__add-card" id = "card-${index}">
                  <div class="product_exibit__add-card__image">
                    <img src = "" id = "img-${index}" title = "">
                  </div>
                  <div class="product_exibit__add-card__btns" >
                    <p class = "new-card-crop" data-index = "${index}">編集</p>
                    <p class = "product_exibit__add-card__btns--delete card-delete" data-index = "${index}" >削除</p>
                  </div>
                </div>`
    return html;
  }
  function fileReader(file){
    var reader = new FileReader();
      reader.onload = (function(file){
        return function(e){
          if(defaultwidth_second === 0){
            $("#exhibit-modal-2").fadeIn();
            return false;
          }
          index += 1
          var html = buildHTMLImage(index);
          $('.product_exibit--wrap').append(html);
          var id = 'img-' + index
          document.getElementById(id).src = e.target.result;
          document.getElementById(id).title = file.name;
          image_data.push(file)
          addcardwidth();
        };
      })(file);
    reader.readAsDataURL(file);    
  }
  $("#exhibit-modal-2").click(function(){$(this).fadeOut()});
  function addcardwidth(){
    defaultwidth += -124
    defaultwidth_second += -124
    if(defaultwidth == 0){
      $('#width-responce-second').fadeIn(0);
      $('#width-responce').fadeOut(0);
    }
    if(defaultwidth_second === 0){
      $('#width-responce-second').css({
        "border":"none"
      });
    }
    document.getElementById('width-responce').style.width = defaultwidth + 'px';
    document.getElementById('width-responce-second').style.width = defaultwidth_second + 'px';
  }
  function deletecardwidth(){
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
  }
  var index = 0
  var defaultwidth = 620
  var defaultwidth_second = 1240
  var image_data = []
  var delete_array = []
  var edit_delete_array = []
  var crop_replace_number = []
  var crop_replace_image = []
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
  $(document).on("click", ".card-delete", function () {
    var index_number = $(this).data('index') - 1
    $(this).parent().parent().remove();
    delete_array.push(index_number);
    deletecardwidth()
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
  // トリミング  
  $(function(){
    var cropper;
    var croppable = false;
    function initIconCrop(){
      cropper = new Cropper(crop_img, {
        dragMode: 'move',
        aspectRatio: 1,
        restore: false,
        guides: false,
        center: false,
        highlight: false,
        cropBoxMovable: false,
        cropBoxResizable: false,
        minCropBoxWidth: 280,
        minCropBoxHeight: 280,
        ready: function(){
          croppable = true;
        }
      });
    }
    var croppedCanvas;
    function iconCropping(){
      if (!croppable) {
        alert('トリミングする画像が設定されていません。');
        return false;
      }
      croppedCanvas = cropper.getCroppedCanvas({
        width: 280,
        height: 280,
      });
      document.getElementById(crop_image_id).src = croppedCanvas.toDataURL();
      croppedCanvas.toBlob(function(b){
        var blob = b;
        crop_replace_number.push(number)
        crop_replace_image.push(blob)
      });
    };
    var number
    var crop_image_id;
    $(document).on("click",".new-card-crop",function(){
      number = $(this).data('index') - 1
      crop_image_id = 'img-' + $(this).data('index')
      var file = image_data[number];
      reader = new FileReader();
      if(file.type.indexOf('image') < 0){
        return false;
      };
      reader.onload = (function(e){
        $('#exhibit-modal-3').fadeIn();
        $('.exhibit-modal__content__edition-field').append($('<img>').attr({
          src: e.target.result,
          height: "100%",
          class: "preview",
          id: "crop_img",
          title: file.name
        }));
        initIconCrop();
      });
      reader.readAsDataURL(file);
    })
    $(document).on("click","#image-crop-cancel",function(){
      $('#exhibit-modal-3').fadeOut();
      $('#crop_img').remove();
      $('.cropper-container').remove();
    });
    $(document).on("click","#image-crop-complete",function(){
      iconCropping();
      $('#exhibit-modal-3').fadeOut();
      $('#crop_img').remove();
      $('.cropper-container').remove();
    });
  })
  // 商品編集
  if(document.URL.match("edit") && document.URL.match("products")){
    var edit_card_counter = $(".count_cards").length
    for(var i=0;i<edit_card_counter;i++){
      addcardwidth()
    }
    // 削除
    $(".card-delete-edit").click(function(){
      $(this).parent().parent().remove();
      delete_id = $(this).data("deleteid")
      edit_delete_array.push(delete_id);
      deletecardwidth();
    })
  }
  // 出品
  $('#new-product').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    for(var i=0;i<crop_replace_number.length;i++){
      image_data[crop_replace_number[i]] = crop_replace_image[i]
    }
    delete_array.forEach(function(index){
      delete image_data[index]
    })
    formData.delete( 'product[image][]' ) ;
    image_data.forEach(function(image){
      formData.append('product[image][]',image );
    })
    if(document.URL.match("edit") && document.URL.match("products")){
      var type = "PATCH"
      var delete_ids = "id = 0"
      edit_delete_array.forEach(function(id){
        delete_ids += " or id = " + id
      })
      formData.append('delete_ids',delete_ids )
    }else{
      var type = "POST"
    }
    $.ajax({
      url: url,
      type: type,
      data:formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(product){
      $("#exhibit-modal-1").fadeIn();
      var html = `<a class="exhibit-modal__content__link" href="/products/${product.id}"><p>商品ページへ行ってシェアする</p></a>`
      $('.exhibit-modal__content').append(html);
    })
    .fail(function(){
      alert('error');
      $('.user-btn').removeAttr('disabled');
    })
  })
});

// 購入後
$(function(){
  $('a.item-detail__buybtn--sold').click(function(){
    return false;
  })
});