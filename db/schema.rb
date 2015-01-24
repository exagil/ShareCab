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

ActiveRecord::Schema.define(version: 20150124122447) do

  create_table "rides", force: :cascade do |t|
    t.string   "origin"
    t.float    "origin_lat"
    t.float    "origin_long"
    t.string   "destination"
    t.float    "destination_lat"
    t.float    "destination_long"
    t.date     "departure_date"
    t.time     "departure_time"
    t.integer  "number_of_seats"
    t.integer  "number_of_seats_occupied"
    t.boolean  "completed"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "ridings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ride_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ridings", ["ride_id"], name: "index_ridings_on_ride_id"
  add_index "ridings", ["user_id"], name: "index_ridings_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "gender"
    t.date     "dob"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
