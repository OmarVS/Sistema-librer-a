# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170225215609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "writer"
    t.string   "editorial"
    t.string   "genre"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "genre_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "stock"
    t.integer  "barcode"
  end

  add_index "books", ["genre_id"], name: "index_books_on_genre_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "in_shopping_carts", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "shopping_cart_id"
    t.integer  "book_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "in_shopping_carts", ["book_id"], name: "index_in_shopping_carts_on_book_id", using: :btree
  add_index "in_shopping_carts", ["product_id"], name: "index_in_shopping_carts_on_product_id", using: :btree
  add_index "in_shopping_carts", ["shopping_cart_id"], name: "index_in_shopping_carts_on_shopping_cart_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.text     "Description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "stock"
    t.integer  "barcode"
    t.string   "trademark"
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.integer  "rut"
    t.string   "business"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "purchase_id"
  end

  add_index "providers", ["purchase_id"], name: "index_providers_on_purchase_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "book_id"
    t.integer  "provider_id"
    t.integer  "product_id"
  end

  add_index "purchases", ["book_id"], name: "index_purchases_on_book_id", using: :btree
  add_index "purchases", ["product_id"], name: "index_purchases_on_product_id", using: :btree
  add_index "purchases", ["provider_id"], name: "index_purchases_on_provider_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "status",     default: 0
    t.string   "ip"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "phone"
    t.string   "email"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "kind",                default: "Cliente"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "books", "genres"
  add_foreign_key "in_shopping_carts", "books"
  add_foreign_key "in_shopping_carts", "products"
  add_foreign_key "in_shopping_carts", "shopping_carts"
  add_foreign_key "providers", "purchases"
  add_foreign_key "purchases", "books"
  add_foreign_key "purchases", "products"
  add_foreign_key "purchases", "providers"
end
