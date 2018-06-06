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

ActiveRecord::Schema.define(version: 2018_05_09_232421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
    t.string "abbr", limit: 4, default: "", null: false
    t.datetime "created_on"
    t.datetime "updated_on"
    t.index ["abbr"], name: "idx_262640_clients_abbr_index", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", limit: 255
    t.string "subtitle", limit: 255
    t.bigint "client_id"
    t.bigint "year"
    t.bigint "month"
    t.text "description"
    t.boolean "visible", default: false
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  create_table "slides", force: :cascade do |t|
    t.bigint "project_id"
    t.string "legacy_image", limit: 255
    t.text "caption"
    t.string "url", limit: 255
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint "position", default: 0
    t.boolean "clip", default: false
  end

  create_table "slides_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "slide_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 255
  end

end
