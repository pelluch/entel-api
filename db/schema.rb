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

ActiveRecord::Schema.define(version: 20150623020431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_traffics", force: :cascade do |t|
    t.integer  "plan_type_id"
    t.integer  "user_id"
    t.date     "day",                        null: false
    t.integer  "messages",     default: 0,   null: false
    t.float    "megabytes",    default: 0.0, null: false
    t.integer  "seconds",      default: 0,   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "daily_traffics", ["plan_type_id"], name: "index_daily_traffics_on_plan_type_id", using: :btree
  add_index "daily_traffics", ["user_id"], name: "index_daily_traffics_on_user_id", using: :btree

  create_table "plan_types", force: :cascade do |t|
    t.text     "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "plan_types", ["name"], name: "index_plan_types_on_name", unique: true, using: :btree

  create_table "plans", force: :cascade do |t|
    t.integer  "plan_type_id"
    t.text     "name",           null: false
    t.integer  "price",          null: false
    t.integer  "internet_price", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "plans", ["plan_type_id", "name"], name: "index_plans_on_plan_type_id_and_name", unique: true, using: :btree
  add_index "plans", ["plan_type_id"], name: "index_plans_on_plan_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "rut",                                 null: false
    t.text     "phone_number",                        null: false
    t.text     "account_holder"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plan_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
  add_index "users", ["plan_id"], name: "index_users_on_plan_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["rut"], name: "index_users_on_rut", unique: true, using: :btree

  add_foreign_key "daily_traffics", "plan_types"
  add_foreign_key "daily_traffics", "users"
  add_foreign_key "plans", "plan_types"
  add_foreign_key "users", "plans"
end
