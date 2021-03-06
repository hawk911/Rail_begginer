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

ActiveRecord::Schema.define(version: 20160716143957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carriage_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carriages", force: :cascade do |t|
    t.string   "name"
    t.integer  "count_up"
    t.integer  "count_down"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "carriage_type_id"
    t.integer  "train_id"
    t.integer  "count_side_down"
    t.integer  "count_side_up"
    t.integer  "count_SB"
    t.integer  "count_seat"
    t.string   "type"
    t.integer  "number"
  end

  add_index "carriages", ["carriage_type_id"], name: "index_carriages_on_carriage_type_id", using: :btree
  add_index "carriages", ["id", "type"], name: "index_carriages_on_id_and_type", using: :btree
  add_index "carriages", ["train_id"], name: "index_carriages_on_train_id", using: :btree

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number"
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer  "railway_station_id"
    t.integer  "route_id"
    t.integer  "position"
    t.datetime "arrival_time"
    t.datetime "departure_time"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tikets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "begin_station_id"
    t.integer  "end_station_id"
    t.integer  "train_id"
    t.integer  "user_id"
    t.string   "user_name"
    t.integer  "passport"
  end

  add_index "tikets", ["begin_station_id"], name: "index_tikets_on_begin_station_id", using: :btree
  add_index "tikets", ["end_station_id"], name: "index_tikets_on_end_station_id", using: :btree
  add_index "tikets", ["train_id"], name: "index_tikets_on_train_id", using: :btree
  add_index "tikets", ["user_id"], name: "index_tikets_on_user_id", using: :btree

  create_table "trains", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
    t.boolean  "sort_from_head",     default: true
  end

  add_index "trains", ["current_station_id"], name: "index_trains_on_current_station_id", using: :btree
  add_index "trains", ["route_id"], name: "index_trains_on_route_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.string   "surname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
