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

ActiveRecord::Schema.define(version: 20150704161662) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "role_feature_permissions", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "role_feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "role_feature_permissions", ["role_feature_id"], name: "index_role_feature_permissions_on_role_feature_id", using: :btree
  add_index "role_feature_permissions", ["role_id", "role_feature_id"], name: "index_role_feature_permissions_on_role_id_and_role_feature_id", using: :btree
  add_index "role_feature_permissions", ["role_id"], name: "index_role_feature_permissions_on_role_id", using: :btree

  create_table "role_features", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "role_features", ["name"], name: "index_role_features_on_name", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",                              null: false
    t.string   "description",       default: "",    null: false
    t.integer  "requires_approval", default: 0,     null: false
    t.boolean  "super_user",        default: false, null: false
    t.string   "landing_page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_session_logs", force: :cascade do |t|
    t.integer  "user_id",                             null: false
    t.string   "session_id",  limit: 200,             null: false
    t.string   "ip_address",  limit: 200
    t.integer  "login_count",             default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "default_theme"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count",        default: 0, null: false
    t.integer  "failed_login_count", default: 0, null: false
    t.datetime "last_login_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "role_id",                        null: false
  end

end
