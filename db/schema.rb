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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110910124557) do

  create_table "bonuses", :force => true do |t|
    t.string   "bonus_type"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.integer  "max_players"
    t.boolean  "is_shared"
  end

  create_table "game_members", :force => true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.date     "game_date"
    t.integer  "goals_home"
    t.integer  "goals_away"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "home_id"
    t.integer  "away_id"
  end

  create_table "players", :force => true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.string   "phone"
    t.string   "email"
    t.string   "mobile"
    t.date     "birthday"
    t.string   "size_shirt"
    t.string   "size_pants"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.integer  "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bonus_id"
  end

  create_table "training_members", :force => true do |t|
    t.integer  "training_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainings", :force => true do |t|
    t.date     "training_date"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
