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

ActiveRecord::Schema.define(version: 2021_12_27_130612) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "want_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "want_id"], name: "index_favorites_on_user_id_and_want_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
    t.index ["want_id"], name: "index_favorites_on_want_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "google_map_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "follow_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wants", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "prefecture_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["prefecture_id"], name: "index_wants_on_prefecture_id"
    t.index ["user_id"], name: "index_wants_on_user_id"
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "favorites", "wants"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "follow_id"
  add_foreign_key "wants", "prefectures"
  add_foreign_key "wants", "users"
end
