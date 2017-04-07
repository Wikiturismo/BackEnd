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

ActiveRecord::Schema.define(version: 20170407151530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commentplaces", force: :cascade do |t|
    t.binary   "state",           default: "false",                 null: false
    t.text     "content",         default: "Comenatario del lugar", null: false
    t.datetime "publicationdate",                                   null: false
    t.integer  "town_id"
    t.integer  "place_id"
    t.integer  "user_id"
    t.integer  "depart_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["depart_id"], name: "index_commentplaces_on_depart_id", using: :btree
    t.index ["place_id"], name: "index_commentplaces_on_place_id", using: :btree
    t.index ["town_id"], name: "index_commentplaces_on_town_id", using: :btree
    t.index ["user_id"], name: "index_commentplaces_on_user_id", using: :btree
  end

  create_table "commenttowns", force: :cascade do |t|
    t.binary   "state",           default: "false",                           null: false
    t.text     "content",         default: "Comenatario de la ciudad/pueblo", null: false
    t.datetime "publicationdate",                                             null: false
    t.integer  "town_id"
    t.integer  "user_id"
    t.integer  "depart_id"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.index ["depart_id"], name: "index_commenttowns_on_depart_id", using: :btree
    t.index ["town_id"], name: "index_commenttowns_on_town_id", using: :btree
    t.index ["user_id"], name: "index_commenttowns_on_user_id", using: :btree
  end

  create_table "departs", force: :cascade do |t|
    t.string   "name",       limit: 45, default: "Nombre del departamento", null: false
    t.string   "capital",    limit: 45, default: "Nombre de la capital",    null: false
    t.string   "demonym",    limit: 45, default: "Gentilicio",              null: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  create_table "imagedeparts", force: :cascade do |t|
    t.integer  "height",                 default: 500,         null: false
    t.integer  "width",                  default: 500,         null: false
    t.string   "path",       limit: 100, default: "Direccion", null: false
    t.integer  "depart_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["depart_id"], name: "index_imagedeparts_on_depart_id", using: :btree
  end

  create_table "imageplaces", force: :cascade do |t|
    t.integer  "height",                 default: 500,         null: false
    t.integer  "width",                  default: 500,         null: false
    t.string   "path",       limit: 100, default: "Direccion", null: false
    t.integer  "place_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["place_id"], name: "index_imageplaces_on_place_id", using: :btree
  end

  create_table "imagetowns", force: :cascade do |t|
    t.integer  "height",                 default: 500,         null: false
    t.integer  "width",                  default: 500,         null: false
    t.string   "path",       limit: 100, default: "Direccion", null: false
    t.integer  "town_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["town_id"], name: "index_imagetowns_on_town_id", using: :btree
  end

  create_table "imgtowns", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name",            limit: 60, default: "Nombre del lugar", null: false
    t.boolean  "state",                      default: false,              null: false
    t.datetime "publicationdate",                                         null: false
    t.text     "description",                default: "Descripcion",      null: false
    t.string   "ubication",       limit: 80, default: "Ubicacion",        null: false
    t.string   "address",         limit: 50, default: "Direccion",        null: false
    t.string   "kind",            limit: 45, default: "Tipo",             null: false
    t.integer  "valoration",                 default: 0
    t.integer  "entrycost",                  default: 0
    t.integer  "town_id"
    t.integer  "depart_id"
    t.integer  "user_id"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
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
    t.string   "name",           limit: 45, default: "Ciudad/Pueblo", null: false
    t.string   "weather",        limit: 45, default: "Clima"
    t.float    "avertemper",                default: 0.0
    t.integer  "altitude",                  default: 0
    t.string   "demonym",        limit: 45, default: "Gentilicio"
    t.boolean  "airport",                   default: true,            null: false
    t.boolean  "transpterminal",            default: true,            null: false
    t.integer  "depart_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["depart_id"], name: "index_towns_on_depart_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 50, default: "Nombre de usuario",  null: false
    t.string   "kind",       limit: 20, default: "Tipo",               null: false
    t.string   "mail",       limit: 60, default: "Correo electronico", null: false
    t.string   "ubication",             default: "Ubicacion"
    t.date     "registdate",                                           null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_foreign_key "commentplaces", "departs"
  add_foreign_key "commentplaces", "places"
  add_foreign_key "commentplaces", "towns"
  add_foreign_key "commentplaces", "users"
  add_foreign_key "commenttowns", "departs"
  add_foreign_key "commenttowns", "towns"
  add_foreign_key "commenttowns", "users"
  add_foreign_key "imagedeparts", "departs"
  add_foreign_key "imageplaces", "places"
  add_foreign_key "imagetowns", "towns"
  add_foreign_key "places", "departs"
  add_foreign_key "places", "towns"
  add_foreign_key "places", "users"
  add_foreign_key "schedules", "places"
  add_foreign_key "towns", "departs"
end
