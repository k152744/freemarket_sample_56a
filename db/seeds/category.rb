big1 = BigCategory.new(name: "レディース")
big1.save

big2 = BigCategory.new(name: "メンズ")
big2.save

big3 = BigCategory.new(name: "ベビー・キッズ")
big3.save

middle1 = MiddleCategory.new(name:"トップス",big_category_id: big1.id)
middle1.save

middle2 = MiddleCategory.new(name:"パンツ",big_category_id: big1.id)
middle2.save

middle3 = MiddleCategory.new(name:"トップス",big_category_id: big2.id)
middle3.save

middle4 = MiddleCategory.new(name:"パンツ",big_category_id: big2.id)
middle4.save

middle5 = MiddleCategory.new(name:"キッズ靴",big_category_id: big3.id)
middle5.save

middle6 = MiddleCategory.new(name:"おもちゃ",big_category_id: big3.id)
middle6.save

small1 = SmallCategory.new(name:"キャミソール",middle_category_id:middle1.id)
small1.save

small2 = SmallCategory.new(name:"ショートパンツ",middle_category_id:middle2.id)
small2.save

small3 = SmallCategory.new(name:"シャツ",middle_category_id:middle3.id)
small3.save

small4 = SmallCategory.new(name:"スラックス",middle_category_id:middle4.id)
small4.save

small5 = SmallCategory.new(name:"スニーカー",middle_category_id:middle5.id)
small5.save

small6 = SmallCategory.new(name:"オルゴール",middle_category_id:middle6.id)
small6.save

