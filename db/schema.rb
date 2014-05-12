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

ActiveRecord::Schema.define(version: 20140512014659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.boolean  "read",       default: false
    t.string   "type"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fight_logs", force: true do |t|
    t.integer  "fight_id",   null: false
    t.integer  "sequence",   null: false
    t.string   "message",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fight_mechs", force: true do |t|
    t.integer  "fight_id",      null: false
    t.integer  "mech_id",       null: false
    t.integer  "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fight_user_id", null: false
  end

  create_table "fight_users", force: true do |t|
    t.integer  "fight_id",                   null: false
    t.integer  "user_id",                    null: false
    t.integer  "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "creator",    default: false, null: false
  end

  create_table "fights", force: true do |t|
    t.datetime "start_time",           null: false
    t.integer  "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_turn_user_id"
  end

  create_table "mechs", force: true do |t|
    t.string   "name"
    t.integer  "num_slots",     default: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "current_armor", default: 50
  end

  create_table "messages", force: true do |t|
    t.integer  "from_id",                    null: false
    t.integer  "to_id",                      null: false
    t.string   "subject"
    t.string   "body"
    t.boolean  "read",       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "crypted_password",  null: false
    t.string   "password_salt",     null: false
    t.string   "persistence_token", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
