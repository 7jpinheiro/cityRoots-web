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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attraction_big_types", force: true do |t|
    t.string "name",        limit: 100, null: false
    t.string "description"
  end

  add_index "attraction_big_types", ["name"], name: "attraction_big_types_name_key", unique: true, using: :btree

  create_table "attraction_types", force: true do |t|
    t.string  "name",                    limit: 100, null: false
    t.string  "description"
    t.integer "attraction_big_types_id",             null: false
  end

  add_index "attraction_types", ["name"], name: "attraction_types_name_key", unique: true, using: :btree

  create_table "cities", force: true do |t|
    t.string  "name",       limit: 100, null: false
    t.string  "abv",        limit: 10,  null: false
    t.integer "country_id",             null: false
  end

  add_index "cities", ["abv"], name: "cities_abv_key", unique: true, using: :btree
  add_index "cities", ["name"], name: "cities_name_key", unique: true, using: :btree

  create_table "comments_itineraries", force: true do |t|
    t.string  "comment",        limit: 500, null: false
    t.date    "evaluationdate",             null: false
    t.integer "mobile_user_id", limit: 8,   null: false
    t.integer "itinerary_id",   limit: 8,   null: false
  end

  create_table "comments_locals", force: true do |t|
    t.string  "comment",        limit: 500, null: false
    t.date    "evaluationdate",             null: false
    t.integer "mobile_user_id", limit: 8,   null: false
    t.integer "local_id",       limit: 8,   null: false
  end

  create_table "countries", force: true do |t|
    t.string "name", limit: 100, null: false
    t.string "abv",  limit: 10,  null: false
  end

  add_index "countries", ["abv"], name: "countries_abv_key", unique: true, using: :btree
  add_index "countries", ["name"], name: "countries_name_key", unique: true, using: :btree

  create_table "event_types", force: true do |t|
    t.string "name",        limit: 100, null: false
    t.string "description"
  end

  add_index "event_types", ["name"], name: "event_types_name_key", unique: true, using: :btree

  create_table "itineraries", force: true do |t|
    t.string  "name",              limit: 100, null: false
    t.string  "description"
    t.integer "itinerary_type_id",             null: false
  end

  add_index "itineraries", ["name"], name: "itineraries_name_key", unique: true, using: :btree

  create_table "itineraries_locals", force: true do |t|
    t.integer "itinerary_id", limit: 8, null: false
    t.integer "local_id",     limit: 8, null: false
  end

  add_index "itineraries_locals", ["itinerary_id", "local_id"], name: "itineraries_locals_ind", using: :btree

  create_table "itineraries_types", force: true do |t|
    t.string "name",        limit: 100, null: false
    t.string "description"
  end

  add_index "itineraries_types", ["name"], name: "itineraries_types_name_key", unique: true, using: :btree

  create_table "languages", force: true do |t|
    t.string "name",        limit: 100, null: false
    t.string "abv",         limit: 10,  null: false
    t.string "description"
  end

  add_index "languages", ["abv"], name: "languages_abv_key", unique: true, using: :btree
  add_index "languages", ["name"], name: "languages_name_key", unique: true, using: :btree

  create_table "local_attractions", id: false, force: true do |t|
    t.integer "id",              limit: 8, null: false
    t.string  "details"
    t.string  "price"
    t.integer "attraction_type",           null: false
  end

  create_table "local_events", id: false, force: true do |t|
    t.integer "id",            limit: 8,   null: false
    t.date    "startdate",                 null: false
    t.date    "enddate",                   null: false
    t.string  "organization",  limit: 100
    t.string  "price",                     null: false
    t.string  "program",       limit: 500
    t.integer "event_type_id",             null: false
  end

  create_table "local_services", id: false, force: true do |t|
    t.integer "id",              limit: 8, null: false
    t.integer "capacity"
    t.string  "details"
    t.integer "service_type_id",           null: false
  end

  create_table "locals", force: true do |t|
    t.string  "name",            limit: 100, null: false
    t.text    "description"
    t.string  "schedule"
    t.string  "site",            limit: 100
    t.string  "email",           limit: 100
    t.string  "address"
    t.string  "coord",           limit: 100
    t.string  "transport",       limit: 100
    t.boolean "reference_point",             null: false
    t.boolean "active",                      null: false
    t.integer "timestamp",       limit: 8,   null: false
    t.integer "city_id",                     null: false
    t.integer "web_user_id",     limit: 8,   null: false
  end

  add_index "locals", ["city_id", "web_user_id"], name: "locals_ind", using: :btree

  create_table "mobile_users", force: true do |t|
    t.string  "firstname",   limit: 100
    t.string  "surname",     limit: 100
    t.string  "gender",      limit: 1
    t.string  "email",                   null: false
    t.string  "username",    limit: 50,  null: false
    t.string  "pass",        limit: 500, null: false
    t.date    "dateofbirth"
    t.boolean "active",                  null: false
    t.integer "language_id",             null: false
    t.integer "country_id",              null: false
  end

  add_index "mobile_users", ["email"], name: "mobile_users_email_key", unique: true, using: :btree
  add_index "mobile_users", ["username"], name: "mobile_users_username_key", unique: true, using: :btree

  create_table "mobile_users_cities", force: true do |t|
    t.integer "city_id",                  null: false
    t.integer "mobile_user_id", limit: 8, null: false
  end

  create_table "pack_types", force: true do |t|
    t.string  "name",        limit: 100,                          null: false
    t.string  "description"
    t.integer "duration",    limit: 2,                            null: false
    t.decimal "price",                   precision: 19, scale: 0, null: false
  end

  add_index "pack_types", ["name"], name: "pack_types_name_key", unique: true, using: :btree

  create_table "photos", force: true do |t|
    t.string  "url",         limit: 500, null: false
    t.string  "name",        limit: 100
    t.string  "description"
    t.string  "extension",   limit: 10
    t.integer "local_id",    limit: 8,   null: false
  end

  add_index "photos", ["local_id"], name: "photos_ind", using: :btree

  create_table "ratings_itineraries", force: true do |t|
    t.integer "rating",         limit: 2, null: false
    t.date    "evaluationdate",           null: false
    t.integer "mobile_user_id", limit: 8, null: false
    t.integer "itinerary_id",   limit: 8, null: false
  end

  create_table "ratings_locals", force: true do |t|
    t.integer "rating",         limit: 2, null: false
    t.date    "evaluationsate",           null: false
    t.integer "mobile_user_id", limit: 8, null: false
    t.integer "local_id",       limit: 8, null: false
  end

  create_table "service_types", force: true do |t|
    t.string "name",        limit: 100, null: false
    t.string "description"
  end

  add_index "service_types", ["name"], name: "service_types_name_key", unique: true, using: :btree

  create_table "web_users", force: true do |t|
    t.string  "name",             limit: 100, null: false
    t.string  "enterprisename"
    t.string  "nif",              limit: 20
    t.string  "address"
    t.string  "email",            limit: 100, null: false
    t.string  "username",         limit: 50,  null: false
    t.string  "pass",             limit: 500, null: false
    t.boolean "active",                       null: false
    t.integer "web_user_type_id",             null: false
    t.integer "city_id"
  end

  add_index "web_users", ["email"], name: "web_users_email_key", unique: true, using: :btree
  add_index "web_users", ["nif"], name: "web_users_nif_key", unique: true, using: :btree
  add_index "web_users", ["username"], name: "web_users_username_key", unique: true, using: :btree

  create_table "web_users_packs", force: true do |t|
    t.date    "subscriptiondate",           null: false
    t.date    "validity",                   null: false
    t.string  "obs"
    t.boolean "active",                     null: false
    t.integer "pack_type_id",               null: false
    t.integer "web_user_id",      limit: 8, null: false
  end

  create_table "web_users_types", force: true do |t|
    t.string "name",        limit: 100, null: false
    t.string "description"
  end

  add_index "web_users_types", ["name"], name: "web_users_types_name_key", unique: true, using: :btree

end
