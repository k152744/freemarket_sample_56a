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

crumb :products do |product|
  link product.name, product_path(product)
  parent :root
end