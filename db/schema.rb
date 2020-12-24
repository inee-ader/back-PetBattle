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

ActiveRecord::Schema.define(version: 2020_12_22_224556) do

  create_table "bosses", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "base_damage"
    t.string "img_url"
    t.string "abilities"
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_bosses_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.boolean "win"
    t.integer "exp"
    t.integer "gold"
    t.integer "user_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_games_on_team_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "pet_teams", force: :cascade do |t|
    t.integer "pet_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_pet_teams_on_pet_id"
    t.index ["team_id"], name: "index_pet_teams_on_team_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "pet_type"
    t.string "abilities"
    t.string "img_url"
    t.string "description"
    t.integer "hp"
    t.integer "level", default: 1
    t.integer "exp", default: 0
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest"
    t.string "alias"
    t.string "bio"
    t.integer "gold", default: 50
    t.string "gif_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bosses", "games"
  add_foreign_key "games", "teams"
  add_foreign_key "games", "users"
  add_foreign_key "pet_teams", "pets"
  add_foreign_key "pet_teams", "teams"
  add_foreign_key "pets", "users"
  add_foreign_key "teams", "users"
end
