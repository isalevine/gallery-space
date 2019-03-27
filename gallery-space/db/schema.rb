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

ActiveRecord::Schema.define(version: 2019_03_26_202611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", force: :cascade do |t|
    t.string "owner_user_id"
    t.string "target_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "theme"
    t.string "blurb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_setting_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.integer "gallery_id"
    t.string "artist"
    t.string "medium"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.string "theme_name"
    t.string "background_color"
    t.string "font"
    t.string "youtube_URL_snippet"
    t.integer "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "real_name"
    t.string "location"
    t.integer "age"
    t.string "blurb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
