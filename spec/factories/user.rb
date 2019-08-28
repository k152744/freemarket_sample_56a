FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name_kanji     {"abe"}
    family_name_kana      {"abe"}
    first_name_kanji      {"abe"}
    first_name_kana       {"abe"}
    birthday              {"00000000"}
  end
end

FactoryBot.define do
  factory :use_request do
    nickname  {"abe"}
    email {"kkk@gmail.com"}
    

    trait :invalid do
      nickname  {nil}
    end
  end

  factory :takashi, class: User do
    id {"1"}
    nickname {"Takashi"}
    email   {"takashi@example.com"}
    password              {"00000000"}
    # password_confirmation {"00000000"}
    family_name_kanji     {"abe"}
    family_name_kana      {"abe"}
    first_name_kanji      {"abe"}
    first_name_kana       {"abe"}
    birthday              {00000000}
    
  end

  # factory :satoshi, class: User do
  #   name "Satoshi"
  #   email "satoshi@example.com"
  # end
end