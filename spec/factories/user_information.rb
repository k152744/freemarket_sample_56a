FactoryBot.define do
  factory :userInformation do
    family_name_kanji_shipping   {"test"}
    first_name_kanji_shipping    {"test"}
    family_name_kana_shipping    {"test"}
    first_name_kana_shipping     {"test"}
    post_number                  {"123456"}
    village                      {"test"}
    address                      {"test"}
    user_id                      {"1111"}
    shipping_origin_id           {"123456"}
  end
end