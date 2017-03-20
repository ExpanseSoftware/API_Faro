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

ActiveRecord::Schema.define(version: 20170314153057) do

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "user_name"
    t.string   "user_lastname"
    t.string   "user_second_lastname"
    t.string   "user_email"
    t.date     "user_birthdate"
    t.string   "user_gender"
    t.string   "password_digest"
    t.string   "token"
    t.boolean  "user_active"
    t.string   "active_account_token"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

end
