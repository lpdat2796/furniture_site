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

ActiveRecord::Schema.define(version: 20210404112248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banners", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.boolean "is_public", default: false
    t.string "url"
    t.integer "sort_order", default: 0
    t.datetime "created_at", default: "2021-04-04 05:27:21", null: false
    t.datetime "updated_at", default: "2021-04-04 05:27:21", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "parent_id", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_public", default: false
  end

  create_table "category_products", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_products_on_category_id"
    t.index ["product_id"], name: "index_category_products_on_product_id"
  end

  create_table "order_deliveries", force: :cascade do |t|
    t.bigint "order_id"
    t.string "address"
    t.string "full_name"
    t.string "phone"
    t.datetime "created_at", default: "2021-04-04 05:27:21", null: false
    t.datetime "updated_at", default: "2021-04-04 05:27:21", null: false
    t.index ["order_id"], name: "index_order_deliveries_on_order_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "amount", default: 1
    t.datetime "created_at", default: "2021-04-04 05:27:21", null: false
    t.datetime "updated_at", default: "2021-04-04 05:27:21", null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.string "status"
    t.integer "total_amount"
    t.string "uuid"
    t.datetime "created_at", default: "2021-04-04 05:27:21", null: false
    t.datetime "updated_at", default: "2021-04-04 05:27:21", null: false
    t.string "reject_comment"
    t.date "expected_shipment_date"
    t.date "shipment_date"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.bigint "product_id"
    t.string "file_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sort_order", default: 0
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.boolean "is_public"
    t.string "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dimension_x"
    t.integer "dimension_y"
    t.integer "dimension_z"
    t.bigint "amount", default: 0
    t.string "card_image"
    t.string "color"
    t.string "material"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "full_name"
    t.string "address"
    t.string "phone"
    t.string "age"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email"
  end

end
