# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_31_153046) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "pet_type"
    t.string "breed"
    t.text "description"
    t.boolean "adopted"
    t.string "gender"
    t.boolean "neutered"
    t.integer "city_id"
    t.integer "shelter_id"
    t.integer "user_id"
    t.index ["city_id"], name: "index_pets_on_city_id"
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.integer "city_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.boolean "shelter_admin"
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 500, default: "", null: false
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.string "google_uid"
    t.string "google_refresh_token"
  end

  add_foreign_key "pets", "cities"
  add_foreign_key "pets", "shelters"
  add_foreign_key "pets", "users"
end
