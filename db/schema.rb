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

ActiveRecord::Schema.define(version: 20170325133635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.boolean   "state"
    t.text     "content"
    t.datetime "publicationdate"
    t.integer  "town_id"
    t.integer  "place_id"
    t.integer  "user_id"
    t.integer  "depart_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["depart_id"], name: "index_comments_on_depart_id", using: :btree
    t.index ["place_id"], name: "index_comments_on_place_id", using: :btree
    t.index ["town_id"], name: "index_comments_on_town_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "departs", force: :cascade do |t|
    t.string   "name"
    t.string   "capital"
    t.string   "demonym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.boolean   "state"
    t.datetime "publicationdate"
    t.text     "description"
    t.string   "ubication"
    t.string   "address"
    t.string   "type"
    t.integer  "valoration"
    t.integer  "entrycost"
    t.integer  "town_id"
    t.integer  "depart_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["depart_id"], name: "index_places_on_depart_id", using: :btree
    t.index ["town_id"], name: "index_places_on_town_id", using: :btree
    t.index ["user_id"], name: "index_places_on_user_id", using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.time     "mondayopen"
    t.time     "mondayclose"
    t.time     "tuesdayopen"
    t.time     "tuesdayclose"
    t.time     "wednesdayopen"
    t.time     "wednesdayclose"
    t.time     "thursdayopen"
    t.time     "thursdayclose"
    t.time     "fridayopen"
    t.time     "fridayclose"
    t.time     "saturdayopen"
    t.time     "saturdayclose"
    t.time     "sundayopen"
    t.time     "sundayclose"
    t.integer  "place_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["place_id"], name: "index_schedules_on_place_id", using: :btree
  end

  create_table "towns", force: :cascade do |t|
    t.string   "name"
    t.string   "weather"
    t.float    "avertemper"
    t.integer  "altitude"
    t.string   "demonym"
    t.boolean   "airport"
    t.boolean   "transpterminal"
    t.integer  "depart_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["depart_id"], name: "index_towns_on_depart_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "mail"
    t.string   "ubication"
    t.date     "registdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "departs"
  add_foreign_key "comments", "places"
  add_foreign_key "comments", "towns"
  add_foreign_key "comments", "users"
  add_foreign_key "places", "departs"
  add_foreign_key "places", "towns"
  add_foreign_key "places", "users"
  add_foreign_key "schedules", "places"
  add_foreign_key "towns", "departs"
end
