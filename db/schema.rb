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

ActiveRecord::Schema.define(version: 20170119185915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title",              null: false
    t.integer  "artist_id",          null: false
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["artist_id"], name: "index_albums_on_artist_id", using: :btree
    t.index ["description"], name: "index_albums_on_description", using: :btree
    t.index ["title"], name: "index_albums_on_title", using: :btree
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "album_id",               null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "length"
    t.integer  "album_track_number"
    t.string   "track_url_file_name"
    t.string   "track_url_content_type"
    t.integer  "track_url_file_size"
    t.datetime "track_url_updated_at"
    t.index ["album_id"], name: "index_tracks_on_album_id", using: :btree
    t.index ["name"], name: "index_tracks_on_name", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                   null: false
    t.string   "password_digest"
    t.string   "session_token"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "primary_color"
    t.string   "secondary_color"
    t.string   "description"
    t.string   "band_name"
    t.string   "header_image_file_name"
    t.string   "header_image_content_type"
    t.integer  "header_image_file_size"
    t.datetime "header_image_updated_at"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

end
