# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_23_060537) do

  create_table "big_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "delivary_days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivary_fees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivary_ways", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favorites_on_product_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.text "image_data", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "middle_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "big_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["big_category_id"], name: "index_middle_categories_on_big_category_id"
  end

  create_table "points", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "number", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "detail", null: false
    t.integer "price", null: false
    t.string "listing_status", null: false
    t.integer "buyer_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.bigint "big_category_id"
    t.bigint "middle_category_id"
    t.bigint "small_category_id"
    t.bigint "status_id"
    t.bigint "delivary_fee_id"
    t.bigint "delivary_way_id"
    t.bigint "delivary_day_id"
    t.bigint "shipping_origin_id"
    t.index ["big_category_id"], name: "index_products_on_big_category_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["delivary_day_id"], name: "index_products_on_delivary_day_id"
    t.index ["delivary_fee_id"], name: "index_products_on_delivary_fee_id"
    t.index ["delivary_way_id"], name: "index_products_on_delivary_way_id"
    t.index ["middle_category_id"], name: "index_products_on_middle_category_id"
    t.index ["shipping_origin_id"], name: "index_products_on_shipping_origin_id"
    t.index ["small_category_id"], name: "index_products_on_small_category_id"
    t.index ["status_id"], name: "index_products_on_status_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "shipping_origins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "small_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "middle_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["middle_category_id"], name: "index_small_categories_on_middle_category_id"
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_informations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "family_name_kanji_shipping", null: false
    t.string "first_name_kanji_shipping", null: false
    t.string "family_name_kana_shipping", null: false
    t.string "first_name_kana_shipping", null: false
    t.integer "post_number", null: false
    t.string "village", null: false
    t.string "address", null: false
    t.string "building_name"
    t.bigint "phone_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shipping_origin_id"
    t.index ["shipping_origin_id"], name: "index_user_informations_on_shipping_origin_id"
    t.index ["user_id"], name: "index_user_informations_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.string "family_name_kanji", null: false
    t.string "first_name_kanji", null: false
    t.string "family_name_kana", null: false
    t.string "first_name_kana", null: false
    t.date "birthday", null: false
    t.string "uid"
    t.string "provider"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cards", "users"
  add_foreign_key "favorites", "products"
  add_foreign_key "favorites", "users"
  add_foreign_key "images", "products"
  add_foreign_key "middle_categories", "big_categories"
  add_foreign_key "points", "users"
  add_foreign_key "products", "big_categories"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "delivary_days"
  add_foreign_key "products", "delivary_fees"
  add_foreign_key "products", "delivary_ways"
  add_foreign_key "products", "middle_categories"
  add_foreign_key "products", "shipping_origins"
  add_foreign_key "products", "small_categories"
  add_foreign_key "products", "statuses"
  add_foreign_key "products", "users"
  add_foreign_key "small_categories", "middle_categories"
  add_foreign_key "user_informations", "shipping_origins"
  add_foreign_key "user_informations", "users"
end
