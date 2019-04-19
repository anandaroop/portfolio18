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

ActiveRecord::Schema.define(version: 2019_04_19_155458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
    t.string "abbr", limit: 4, default: "", null: false
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string "slug"
    t.index ["abbr"], name: "idx_16615_clients_abbr_index", unique: true
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
    t.string "slug"
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
    t.text "image_data"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "tags_slides", id: false, force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "slide_id"
  end

end
