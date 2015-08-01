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

ActiveRecord::Schema.define(version: 20150801050351) do

  create_table "master_pieces", force: true do |t|
    t.string  "name"
    t.integer "posx"
    t.integer "posy"
    t.integer "owner"
  end

  create_table "pieces", force: true do |t|
    t.integer  "piece_id",                   null: false
    t.integer  "play_id",                    null: false
    t.integer  "posx",                       null: false
    t.integer  "posy",                       null: false
    t.integer  "owner"
    t.boolean  "promote",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playing_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "play_id"
    t.string   "role"
    t.string   "exit_flag",  default: "0", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "playing_users", ["play_id"], name: "index_playing_users_on_play_id", using: :btree
  add_index "playing_users", ["user_id"], name: "index_playing_users_on_user_id", using: :btree

  create_table "plays", force: true do |t|
    t.integer  "turn_player"
    t.string   "state",        default: "waiting", null: false
    t.string   "room_no",      default: "1",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "first_player"
    t.integer  "last_player"
    t.integer  "turn_count",   default: 1,         null: false
    t.integer  "winner"
  end

  create_table "users", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
