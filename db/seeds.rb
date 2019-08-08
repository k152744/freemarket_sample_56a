

Brand.find_or_create_by(name:"グッチ")
Brand.find_or_create_by(name:"シャネル")
Brand.find_or_create_by(name:"サンローラン")


DelivaryWay.find_or_create_by(name: "未定")
DelivaryWay.find_or_create_by(name: "らくらくメルカリ便")
DelivaryWay.find_or_create_by(name: "ゆうメール")
DelivaryWay.find_or_create_by(name: "レターパック")
DelivaryWay.find_or_create_by(name: "普通郵便(定形、定形外)")
DelivaryWay.find_or_create_by(name: "クロネコヤマト")
DelivaryWay.find_or_create_by(name: "ゆうパック")
DelivaryWay.find_or_create_by(name: "クリックポスト")
DelivaryWay.find_or_create_by(name: "ゆうパケット")


DelivaryFee.find_or_create_by(name: "送料込み(出品者負担)")
DelivaryFee.find_or_create_by(name: "着払い(購入者負担)")


DelivaryDay.find_or_create_by(name: "1~2日で発送")
DelivaryDay.find_or_create_by(name: "2~3日で発送")
DelivaryDay.find_or_create_by(name: "4~7日で発送")


Status.find_or_create_by(name:"新品、未使用")
Status.find_or_create_by(name:"未使用に近い")
Status.find_or_create_by(name:"目立った傷や汚れなし")
Status.find_or_create_by(name:"やや傷や汚れあり")
Status.find_or_create_by(name:"傷や汚れあり")
Status.find_or_create_by(name:"全体的に状態が悪い")


ShippingOrigin.find_or_create_by(name: "北海道")
ShippingOrigin.find_or_create_by(name: "沖縄")
ShippingOrigin.find_or_create_by(name: "大阪")

big1 = BigCategory.find_or_initialize_by(name: "レディース")
if big1.new_record? # 新規データなら保存
  big1.save!
  middle1 = MiddleCategory.new(name:"トップス",big_category_id: big1.id)
  middle1.save

  middle2 = MiddleCategory.new(name:"パンツ",big_category_id: big1.id)
  middle2.save

  small1 = SmallCategory.new(name:"キャミソール",middle_category_id:middle1.id)
  small1.save
  
  small2 = SmallCategory.new(name:"ショートパンツ",middle_category_id:middle2.id)
  small2.save
end

big2 = BigCategory.find_or_initialize_by(name: "メンズ")
if big2.new_record? # 新規データなら保存
  big2.save!
  middle3 = MiddleCategory.new(name:"トップス",big_category_id: big2.id)
  middle3.save

  middle4 = MiddleCategory.new(name:"パンツ",big_category_id: big2.id)
  middle4.save

  small3 = SmallCategory.new(name:"シャツ",middle_category_id:middle3.id)
  small3.save

  small4 = SmallCategory.new(name:"スラックス",middle_category_id:middle4.id)
  small4.save
end

big3 = BigCategory.find_or_initialize_by(name: "ベビー・キッズ")
if big3.new_record? # 新規データなら保存
  big3.save!

  middle5 = MiddleCategory.new(name:"キッズ靴",big_category_id: big3.id)
  middle5.save

  middle6 = MiddleCategory.new(name:"おもちゃ",big_category_id: big3.id)
  middle6.save

  small5 = SmallCategory.new(name:"スニーカー",middle_category_id:middle5.id)
  small5.save

  small6 = SmallCategory.new(name:"オルゴール",middle_category_id:middle6.id)
  small6.save
end








