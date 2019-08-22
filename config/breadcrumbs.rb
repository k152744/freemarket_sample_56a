crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :logout do
  link "ログアウト", logout_user_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", edit_user_path
  parent :mypage
end

crumb :pay do
  link "支払方法", cards_path
  parent :mypage
end

crumb :products do |product|
  link product.name, product_path(product)
  parent :root
end

crumb :categories do 
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :list do 
  link "出品した商品 - 出品中", listing_user_information_path(current_user)
  parent :mypage
end

crumb :big_category do |category|
  link category.name, category_path(category)
  parent :categories
end


crumb :middle_category do |category|
  big_category = BigCategory.find(category.big_category_id)
  link category.name, middle_category_path(category)
  parent :big_category,big_category
end

crumb :small_category do |category|
  middle_category = MiddleCategory.find(category.middle_category_id)
  link category.name, small_category_path(category)
  parent :middle_category,middle_category
end