$(function(){
  $(".use_points_form").on("change",function(){
    var input = $(this).val();
    var price = $(this).data("price-id");
    var max_point = $(this).data("user-point-id")
    var total_price = price - input
    
    if (input > max_point){
      alert('入力できる範囲を超えています');
      $(".use_points_form").val(max_point);
      $("#cell--text").text(`¥ ${price - max_point}`);
    }else{
      $("#cell--text").text(`¥ ${total_price}`);
    }
  })
})
