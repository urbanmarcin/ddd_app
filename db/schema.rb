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

ActiveRecord::Schema.define(version: 20191226083218) do

  create_table "event_store_events", id: false, force: :cascade do |t|
    t.string   "id",         limit: 36
    t.string   "event_type",            null: false
    t.binary   "metadata"
    t.binary   "data",                  null: false
    t.datetime "created_at",            null: false
  end

  add_index "event_store_events", ["created_at"], name: "index_event_store_events_on_created_at"
  add_index "event_store_events", ["event_type"], name: "index_event_store_events_on_event_type"
  add_index "event_store_events", ["id"], name: "index_event_store_events_on_id", unique: true

  create_table "event_store_events_in_streams", force: :cascade do |t|
    t.string   "stream",                null: false
    t.integer  "position"
    t.string   "event_id",   limit: 36, null: false
    t.datetime "created_at",            null: false
  end

  add_index "event_store_events_in_streams", ["created_at"], name: "index_event_store_events_in_streams_on_created_at"
  add_index "event_store_events_in_streams", ["stream", "event_id"], name: "index_event_store_events_in_streams_on_stream_and_event_id", unique: true
  add_index "event_store_events_in_streams", ["stream", "position"], name: "index_event_store_events_in_streams_on_stream_and_position", unique: true

end
