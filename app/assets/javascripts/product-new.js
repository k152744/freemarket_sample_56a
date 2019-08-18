// 画像アップロード
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
  $('#product_image').change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
    reader.onload = (function(file){
      return function(e){
        index += 1
        defaultwidth += -124
        console.log(index)
        console.log(defaultwidth)
        // var src = e.target.result
        // var filedata = file.name
        // var arrayimage = [index,src,filedata]
        var html = buildHTMLImage(index);
        document.getElementById('width-responce').style.width = defaultwidth + 'px';
        $('.product_exibit--wrap').append(html);
        var id = 'img-' + index
        document.getElementById(id).src = e.target.result;
        document.getElementById(id).title = file.name;
      };
    })(file);
    reader.readAsDataURL(file);
  });
  // 画像削除
  $(document).on("click", ".product_exibit__add-card__btns--delete", function () {
    console.log("fire")
    var index_number = $(this).data('index')
    $(this).parent().parent().remove();
    delete_array.push(index_number);
    console.log(delete_array);
    defaultwidth += 124
    document.getElementById('width-responce').style.width = defaultwidth + 'px';
  });
});

// 出品後
// $(id).attr("src", e.target.result);
// $(id).attr("title", file.name);
// 購入後
$(function(){
  $('a.item-detail__buybtn--sold').click(function(){
    return false;
  })
});