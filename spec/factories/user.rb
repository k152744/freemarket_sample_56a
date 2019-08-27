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