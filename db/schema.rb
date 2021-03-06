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

ActiveRecord::Schema.define(version: 20150607102151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "media", force: :cascade do |t|
    t.integer  "store_id"
    t.string   "caption_text"
    t.string   "low_resolution"
    t.string   "thumbnail"
    t.string   "standard_resolution"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "media", ["store_id"], name: "index_media_on_store_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "username"
    t.integer  "insta_id"
    t.string   "profile_picture"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "price"
    t.string   "category"
    t.string   "name"
    t.integer  "medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["medium_id"], name: "index_tags_on_medium_id", using: :btree

  add_foreign_key "tags", "media"
end
