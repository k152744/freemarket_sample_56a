FactoryBot.define do
  factory :product do
    name                {"abe"}
    detail              {"サンプル"}
    price               {"111"}
    listing_status      {"サンプル"}
    user_id             {"000"}
    brand_id            {"1"}
    big_category_id     {"1"}
    middle_category_id  {"1"}
    small_category_id   {"1"}
    status_id           {"1"}
    delivary_fee_id     {"1"}
    delivary_way_id     {"1"}
    delivary_day_id     {"1"}
    shipping_origin_id  {"1"}
  end
end