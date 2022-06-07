# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_07_100225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "descritpion"
    t.float "latitude"
    t.float "longtitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "journey_venues", force: :cascade do |t|
    t.bigint "venue_id", null: false
    t.bigint "journey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journey_id"], name: "index_journey_venues_on_journey_id"
    t.index ["venue_id"], name: "index_journey_venues_on_venue_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_journeys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venue_categories", force: :cascade do |t|
    t.bigint "categories_id", null: false
    t.bigint "venues_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categories_id"], name: "index_venue_categories_on_categories_id"
    t.index ["venues_id"], name: "index_venue_categories_on_venues_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "address"
    t.text "description"
    t.integer "rating"
    t.string "name"
    t.bigint "city_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_venues_on_city_id"
  end

  add_foreign_key "journey_venues", "journeys"
  add_foreign_key "journey_venues", "venues"
  add_foreign_key "journeys", "users"
  add_foreign_key "venue_categories", "categories", column: "categories_id"
  add_foreign_key "venue_categories", "venues", column: "venues_id"
  add_foreign_key "venues", "cities"
end
