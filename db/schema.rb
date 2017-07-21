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

ActiveRecord::Schema.define(version: 20170721212220) do

  create_table "creators", force: :cascade do |t|
    t.string   "creator_type"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.integer  "stored_product_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["stored_product_id"], name: "index_creators_on_stored_product_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "quote"
    t.string   "citation"
    t.string   "publication"
    t.integer  "stored_product_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["stored_product_id"], name: "index_reviews_on_stored_product_id"
  end

  create_table "rights_holders", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "email"
    t.integer  "stored_product_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["stored_product_id"], name: "index_rights_holders_on_stored_product_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", null: false
    t.string   "shopify_token",  null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  create_table "stored_products", force: :cascade do |t|
    t.string   "title"
    t.string   "body_html"
    t.string   "vendor"
    t.string   "product_type"
    t.boolean  "published",                   default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "posted",                      default: false
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.string   "vendor_logo_file_name"
    t.string   "vendor_logo_content_type"
    t.integer  "vendor_logo_file_size"
    t.datetime "vendor_logo_updated_at"
  end

  create_table "sub_tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_sub_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "stored_product_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["stored_product_id"], name: "index_tags_on_stored_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "authentication_token",   limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
