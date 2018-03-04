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

ActiveRecord::Schema.define(version: 20180304014722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "divisions", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_entries_on_team_id"
    t.index ["tournament_id"], name: "index_entries_on_tournament_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_fields_on_event_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "home_score", default: 0
    t.integer "away_score", default: 0
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.bigint "timeslot_id"
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["timeslot_id"], name: "index_matches_on_timeslot_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "captain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "recruiting", default: false
    t.index ["captain_id"], name: "index_teams_on_captain_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_timeslots_on_field_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.bigint "division_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["division_id"], name: "index_tournaments_on_division_id"
    t.index ["event_id"], name: "index_tournaments_on_event_id"
  end

  create_table "user_teams", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_user_teams_on_team_id"
    t.index ["user_id"], name: "index_user_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "entries", "teams"
  add_foreign_key "entries", "tournaments"
  add_foreign_key "fields", "events"
  add_foreign_key "matches", "entries", column: "away_team_id"
  add_foreign_key "matches", "entries", column: "home_team_id"
  add_foreign_key "matches", "timeslots"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "teams", "users", column: "captain_id"
  add_foreign_key "timeslots", "fields"
  add_foreign_key "tournaments", "divisions"
  add_foreign_key "tournaments", "events"
  add_foreign_key "user_teams", "teams"
  add_foreign_key "user_teams", "users"
end
