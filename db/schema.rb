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

ActiveRecord::Schema.define(version: 20140322155228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_boards", force: true do |t|
    t.string   "title",      null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title",           null: false
    t.string   "employer"
    t.integer  "hours_per_week"
    t.string   "location"
    t.string   "employment"
    t.string   "job_posting_url"
    t.string   "local_url"
    t.string   "employer_portal"
    t.string   "portal_login"
    t.string   "date_applied"
    t.string   "status",          null: false
    t.string   "referred_by"
    t.string   "reminder"
    t.integer  "user_id"
    t.integer  "job_board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["job_posting_url"], name: "index_posts_on_job_posting_url", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
