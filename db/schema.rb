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

ActiveRecord::Schema.define(version: 20161210205034) do

  create_table "signups", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tripitems", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "activity_name"
    t.string   "location_name"
    t.string   "location_url"
    t.datetime "activity_time"
    t.string   "activity_address"
    t.string   "activity_address_url"
    t.string   "sherpa_tip"
    t.string   "reservation"
    t.integer  "trip_id"
    t.index ["trip_id"], name: "index_tripitems_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "tripitem_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "trip_message"
    t.string   "sherpa_owner"
    t.date     "date_of_travel"
    t.string   "client_email"
    t.string   "client_phone"
    t.integer  "user_id"
    t.index ["id"], name: "sqlite_autoindex_trips_1", unique: true
    t.index ["tripitem_id"], name: "index_trips_on_tripitem_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "user_type"
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
