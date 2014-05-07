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

ActiveRecord::Schema.define(version: 20140507043209) do

  create_table "app_mod_logs", force: true do |t|
    t.string   "action"
    t.string   "other_desc"
    t.string   "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apps", primary_key: "appid", force: true do |t|
    t.text     "appname"
    t.text     "git"
    t.text     "dbname"
    t.text     "domainname"
    t.text     "path"
    t.text     "status"
    t.text     "planid"
    t.text     "uid"
    t.text     "bw_usage"
    t.text     "storage_usage"
    t.text     "db_usage"
    t.date     "expire_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_update_bw"
    t.datetime "last_reset"
  end

  create_table "coupon_useds", primary_key: "cid", force: true do |t|
    t.text     "uid"
    t.time     "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", primary_key: "cid", force: true do |t|
    t.text     "code"
    t.text     "planid"
    t.text     "activate"
    t.text     "other_desc"
    t.date     "expire_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "db_apps", force: true do |t|
    t.string   "db_name"
    t.string   "appid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_coupons", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", primary_key: "planid", force: true do |t|
    t.text     "planname"
    t.text     "max_bw"
    t.text     "max_storage"
    t.text     "max_db"
    t.text     "plantime"
    t.integer  "price"
    t.text     "other_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stageprocesses", force: true do |t|
    t.text     "appname"
    t.text     "stage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", primary_key: "uid", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "fullname",                            null: false
    t.text     "username",                            null: false
    t.text     "address"
    t.date     "birthdate"
    t.text     "tel",                                 null: false
    t.text     "mobile",                              null: false
    t.text     "citizen_id",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
