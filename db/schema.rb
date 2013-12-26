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

ActiveRecord::Schema.define(version: 20131226005004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attraction_translations", force: true do |t|
    t.string  "name",          limit: 100, null: false
    t.string  "schedule"
    t.string  "language",      limit: 20,  null: false
    t.text    "description"
    t.string  "transport",     limit: 100
    t.integer "attraction_id", limit: 8,   null: false
  end

  create_table "attraction_types", force: true do |t|
    t.integer "type_id",                 null: false
    t.integer "attraction_id", limit: 8, null: false
  end

  create_table "attractions", force: true do |t|
    t.string  "site",            limit: 100
    t.string  "email",           limit: 100
    t.string  "address"
    t.float   "latitude"
    t.float   "longitude"
    t.boolean "active",                      default: true,  null: false
    t.integer "timestamp",       limit: 8,                   null: false
    t.boolean "reference_point",                             null: false
    t.string  "price"
    t.float   "rating",                      default: 0.0,   null: false
    t.boolean "accessibility",               default: false, null: false
    t.integer "city_id",                                     null: false
    t.integer "web_user_id",     limit: 8,                   null: false
  end

  create_table "cities", force: true do |t|
    t.string  "name",       limit: 100, null: false
    t.string  "abv",        limit: 10,  null: false
    t.integer "country_id",             null: false
  end

  add_index "cities", ["abv"], name: "cities_abv_key", unique: true, using: :btree
  add_index "cities", ["name"], name: "cities_name_key", unique: true, using: :btree

  create_table "comment_attractions", force: true do |t|
    t.text    "comment",                  null: false
    t.date    "evaluationdate",           null: false
    t.integer "mobile_user_id", limit: 8, null: false
    t.integer "attraction_id",  limit: 8, null: false
  end

  create_table "comment_events", force: true do |t|
    t.text    "comment",                  null: false
    t.date    "evaluationdate",           null: false
    t.integer "mobile_user_id", limit: 8, null: false
    t.integer "event_id",       limit: 8, null: false
  end

  create_table "comment_itineraries", force: true do |t|
    t.string  "comment",        limit: 500, null: false
    t.date    "evaluationdate",             null: false
    t.integer "itinerary_id",   limit: 8,   null: false
    t.integer "mobile_user_id", limit: 8,   null: false
  end

  create_table "comment_services", force: true do |t|
    t.text    "comment",                  null: false
    t.date    "evaluationdate",           null: false
    t.integer "mobile_user_id", limit: 8, null: false
    t.integer "service_id",     limit: 8, null: false
  end

  create_table "countries", force: true do |t|
    t.string "name", limit: 100, null: false
    t.string "abv",  limit: 10,  null: false
  end

  add_index "countries", ["abv"], name: "countries_abv_key", unique: true, using: :btree
  add_index "countries", ["name"], name: "countries_name_key", unique: true, using: :btree

  create_table "event_translations", force: true do |t|
    t.string  "name",        limit: 100, null: false
    t.string  "schedule"
    t.string  "language",    limit: 20,  null: false
    t.text    "description"
    t.string  "transport",   limit: 100
    t.integer "event_id",    limit: 8,   null: false
  end

  create_table "event_types", force: true do |t|
    t.integer "event_id", limit: 8, null: false
    t.integer "type_id",            null: false
  end

  create_table "events", force: true do |t|
    t.string  "site",          limit: 100
    t.string  "email",         limit: 100
    t.string  "address"
    t.float   "latitude"
    t.float   "longitude"
    t.boolean "active",                    default: true,  null: false
    t.integer "timestamp",     limit: 8,                   null: false
    t.date    "startdate"
    t.date    "enddate"
    t.string  "organization",  limit: 100
    t.string  "price",                                     null: false
    t.string  "program",       limit: 500
    t.float   "rating",                    default: 0.0,   null: false
    t.boolean "accessibility",             default: false, null: false
    t.integer "city_id",                                   null: false
    t.integer "web_user_id",   limit: 8,                   null: false
  end

  create_table "itineraries", force: true do |t|
    t.string  "name",              limit: 100, null: false
    t.string  "description"
    t.integer "itinerary_type_id",             null: false
    t.integer "user_id",           limit: 8,   null: false
  end

  add_index "itineraries", ["name"], name: "itineraries_name_key", unique: true, using: :btree

  create_table "itinerary_attractions", force: true do |t|
    t.integer "order",                   null: false
    t.integer "itinerary_id",  limit: 8, null: false
    t.integer "attraction_id", limit: 8, null: false
  end

  add_index "itinerary_attractions", ["itinerary_id", "attraction_id"], name: "itinerary_attractions_index", using: :btree

  create_table "itinerary_events", force: true do |t|
    t.integer "order",                  null: false
    t.integer "itinerary_id", limit: 8, null: false
    t.integer "event_id",     limit: 8, null: false
  end

  add_index "itinerary_events", ["itinerary_id", "event_id"], name: "itinerary_events_index", using: :btree

  create_table "itinerary_services", force: true do |t|
    t.integer "order",                  null: false
    t.integer "itinerary_id", limit: 8, null: false
    t.integer "service_id",   limit: 8, null: false
  end

  add_index "itinerary_services", ["itinerary_id", "service_id"], name: "itinerary_services_index", using: :btree

  create_table "itinerary_types", force: true do |t|
    t.string "name",        limit: 100, null: false
    t.string "description"
  end

  add_index "itinerary_types", ["name"], name: "itinerary_types_name_key", unique: true, using: :btree

  create_table "languages", force: true do |t|
    t.string "name",        limit: 100, null: false
    t.string "abv",         limit: 10,  null: false
    t.string "description"
  end

  add_index "languages", ["abv"], name: "languages_abv_key", unique: true, using: :btree
  add_index "languages", ["name"], name: "languages_name_key", unique: true, using: :btree

  create_table "mobile_user_cities", force: true do |t|
    t.integer "city_id",                  null: false
    t.integer "mobile_user_id", limit: 8, null: false
  end

  create_table "mobile_users", id: false, force: true do |t|
    t.integer "id",          limit: 8,   null: false
    t.string  "firstname",   limit: 100
    t.string  "surname",     limit: 100
    t.string  "gender",      limit: 1
    t.date    "dateofbirth"
    t.boolean "active",                  null: false
  end

  create_table "pack_types", force: true do |t|
    t.string  "name",        limit: 100,                          null: false
    t.string  "description"
    t.integer "duration",    limit: 2,                            null: false
    t.decimal "price",                   precision: 19, scale: 0, null: false
  end

  add_index "pack_types", ["name"], name: "pack_types_name_key", unique: true, using: :btree

  create_table "photo_attractions", force: true do |t|
    t.string  "name",               limit: 100, null: false
    t.string  "photo_file_name",    limit: 100, null: false
    t.string  "photo_content_type", limit: 100
    t.integer "photo_file_size",    limit: 8
    t.date    "photo_updated_at"
    t.string  "description"
    t.integer "attraction_id",      limit: 8,   null: false
  end

  add_index "photo_attractions", ["attraction_id"], name: "photos_attractions_index", using: :btree

  create_table "photo_events", force: true do |t|
    t.string   "name",               limit: 100, null: false
    t.string   "photo_file_name",    limit: 100, null: false
    t.string   "photo_content_type", limit: 100
    t.integer  "photo_file_size",    limit: 8
    t.date     "photo_updated_at"
    t.string   "description"
    t.integer  "event_id",           limit: 8,   null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_upload_at"
  end

  add_index "photo_events", ["event_id"], name: "photo_events_index", using: :btree

  create_table "photo_services", force: true do |t|
    t.string  "name",                limit: 100
    t.string  "photo_file_name",     limit: 100
    t.string  "photo_content_type ", limit: 100
    t.integer "photo_file_size",     limit: 8
    t.date    "photo_updated_at"
    t.string  "description"
    t.integer "service_id",          limit: 8,   null: false
  end

  add_index "photo_services", ["service_id"], name: "photos_services_index", using: :btree

  create_table "rating_attractions", force: true do |t|
    t.integer "rating",         limit: 2, null: false
    t.date    "evaluationdate",           null: false
    t.integer "mobile_user_id", limit: 8, null: false
    t.integer "attraction_id",  limit: 8, null: false
  end

  create_table "rating_events", force: true do |t|
    t.integer "rating",         limit: 2, null: false
    t.date    "evaluationdate",           null: false
    t.integer "mobile_user_id", limit: 8, null: false
    t.integer "event_id",       limit: 8, null: false
  end

  create_table "rating_itineraries", force: true do |t|
    t.integer "rating",         limit: 2, null: false
    t.date    "evaluationdate",           null: false
    t.integer "itinerary_id",   limit: 8, null: false
    t.integer "mobile_user_id", limit: 8, null: false
  end

  create_table "rating_services", force: true do |t|
    t.integer "rating",         limit: 2, null: false
    t.date    "evaluationdate",           null: false
    t.integer "mobile_user_id", limit: 8, null: false
    t.integer "service_id",     limit: 8, null: false
  end

  create_table "service_translations", force: true do |t|
    t.string  "name",        limit: 100, null: false
    t.string  "schedule"
    t.string  "language",    limit: 20,  null: false
    t.text    "description"
    t.string  "transport",   limit: 100
    t.integer "service_id",  limit: 8,   null: false
  end

  create_table "service_types", force: true do |t|
    t.integer "service_id", limit: 8, null: false
    t.integer "type_id",              null: false
  end

  create_table "services", force: true do |t|
    t.string  "site",            limit: 100
    t.string  "email",           limit: 100
    t.string  "address"
    t.float   "latitude"
    t.float   "longitude"
    t.boolean "active",                      default: true,  null: false
    t.integer "timestamp",       limit: 8,                   null: false
    t.boolean "reference_point",                             null: false
    t.integer "capacity"
    t.string  "details"
    t.float   "rating",                      default: 0.0,   null: false
    t.boolean "accessibility",               default: false, null: false
    t.integer "web_user_id",     limit: 8,                   null: false
    t.integer "city_id",                                     null: false
  end

  create_table "types", force: true do |t|
    t.string "name",        limit: 100, null: false
    t.string "description"
  end

  add_index "types", ["name"], name: "types_name_key", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string  "email",                              null: false
    t.string  "username",               limit: 50
    t.string  "encrypted_password",     limit: 500, null: false
    t.string  "type"
    t.text    "serviceid"
    t.integer "language_id"
    t.integer "country_id"
    t.string  "reset_password_token",   limit: 150
    t.date    "reset_password_sent_at"
    t.date    "remember_created_at"
    t.integer "sign_in_count"
    t.date    "current_sign_in_at"
    t.date    "last_sign_in_at"
    t.string  "current_sign_in_ip",     limit: 50
    t.string  "last_sign_in_ip",        limit: 50
    t.string  "confirmation_token",     limit: 150
    t.date    "confirmed_at"
    t.date    "confirmation_sent_at"
    t.string  "unconfirmed_email",      limit: 50
    t.integer "failed_attempts"
    t.string  "unlock_token",           limit: 50
    t.date    "locked_at"
  end

  add_index "users", ["email"], name: "users_email_key", unique: true, using: :btree
  add_index "users", ["username"], name: "users_username_key", unique: true, using: :btree

  create_table "web_user_packs", force: true do |t|
    t.date    "subscriptiondate",           null: false
    t.date    "validity",                   null: false
    t.string  "obs"
    t.boolean "active",                     null: false
    t.integer "pack_type_id",               null: false
    t.integer "web_user_id",      limit: 8, null: false
  end

  create_table "web_user_types", force: true do |t|
    t.string "name",        limit: 100, null: false
    t.string "description"
  end

  add_index "web_user_types", ["name"], name: "web_user_types_name_key", unique: true, using: :btree

  create_table "web_users", id: false, force: true do |t|
    t.integer "id",               limit: 8,   null: false
    t.string  "name",             limit: 100, null: false
    t.string  "enterprisename"
    t.string  "nif",              limit: 20
    t.string  "address"
    t.boolean "active",                       null: false
    t.integer "web_user_type_id",             null: false
    t.integer "city_id"
  end

  add_index "web_users", ["nif"], name: "web_users_nif_key", unique: true, using: :btree

end
