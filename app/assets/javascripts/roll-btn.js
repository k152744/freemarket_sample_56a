$(function(){
	// ボタンをクリックした時
	$('.exhibit-btn').click(function(){
		// degという変数を0から360まで3秒かけて変化させる。
		$({deg:0}).animate({deg:360}, {
			duration:3000,
			// 途中経過
			progress:function() {
				$('.exhibit-btn').css({
					transform:'rotate(' + this.deg + 'deg)'
				});
			},
		});
	});
});