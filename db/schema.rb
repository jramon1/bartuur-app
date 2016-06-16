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

ActiveRecord::Schema.define(version: 20160616124911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appreciations", force: :cascade do |t|
    t.boolean  "liked",      default: false
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "appreciations", ["product_id"], name: "index_appreciations_on_product_id", using: :btree
  add_index "appreciations", ["user_id"], name: "index_appreciations_on_user_id", using: :btree

  create_table "attachinary_files", force: :cascade do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.string   "pic_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "code"
    t.integer  "appreciation_id"
    t.integer  "secondary_appreciation_id"
    t.integer  "integer"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "matches", ["appreciation_id"], name: "index_matches_on_appreciation_id", using: :btree
  add_index "matches", ["secondary_appreciation_id"], name: "index_matches_on_secondary_appreciation_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["match_id"], name: "index_messages_on_match_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "dislikes",    default: 0
    t.boolean  "delivered",   default: false
    t.integer  "value"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "token"
    t.datetime "token_expiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "appreciations", "products"
  add_foreign_key "appreciations", "users"
  add_foreign_key "matches", "appreciations"
  add_foreign_key "matches", "appreciations", column: "secondary_appreciation_id"
  add_foreign_key "messages", "matches"
  add_foreign_key "messages", "users"
  add_foreign_key "products", "users"
end
