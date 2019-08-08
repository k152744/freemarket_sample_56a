Brand.create(name:"グッチ")
Brand.create(name:"シャネル")
Brand.create(name:"サンローラン")


DelivaryWay.create(name: "未定")
DelivaryWay.create(name: "らくらくメルカリ便")
DelivaryWay.create(name: "ゆうメール")
DelivaryWay.create(name: "レターパック")
DelivaryWay.create(name: "普通郵便(定形、定形外)")
DelivaryWay.create(name: "クロネコヤマト")
DelivaryWay.create(name: "ゆうパック")
DelivaryWay.create(name: "クリックポスト")
DelivaryWay.create(name: "ゆうパケット")


DelivaryFee.create(name: "送料込み(出品者負担)")
DelivaryFee.create(name: "着払い(購入者負担)")


DelivaryDay.create(name: "1~2日で発送")
DelivaryDay.create(name: "2~3日で発送")
DelivaryDay.create(name: "4~7日で発送")


Status.create(name:"新品、未使用")
Status.create(name:"未使用に近い")
Status.create(name:"目立った傷や汚れなし")
Status.create(name:"やや傷や汚れあり")
Status.create(name:"傷や汚れあり")
Status.create(name:"全体的に状態が悪い")


ShippingOrigin.create(name: "北海道")
ShippingOrigin.create(name: "沖縄")
ShippingOrigin.create(name: "大阪")
