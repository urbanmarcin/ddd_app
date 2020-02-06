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

ActiveRecord::Schema.define(version: 20200123073919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "event_store_events", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.string   "event_type", null: false
    t.binary   "metadata"
    t.binary   "data",       null: false
    t.datetime "created_at", null: false
  end

  add_index "event_store_events", ["created_at"], name: "index_event_store_events_on_created_at", using: :btree
  add_index "event_store_events", ["event_type"], name: "index_event_store_events_on_event_type", using: :btree

  create_table "event_store_events_in_streams", force: :cascade do |t|
    t.string   "stream",     null: false
    t.integer  "position"
    t.uuid     "event_id",   null: false
    t.datetime "created_at", null: false
  end

  add_index "event_store_events_in_streams", ["created_at"], name: "index_event_store_events_in_streams_on_created_at", using: :btree
  add_index "event_store_events_in_streams", ["stream", "event_id"], name: "index_event_store_events_in_streams_on_stream_and_event_id", unique: true, using: :btree
  add_index "event_store_events_in_streams", ["stream", "position"], name: "index_event_store_events_in_streams_on_stream_and_position", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "uid"
    t.string   "state"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "title_max_length"
  end

end
