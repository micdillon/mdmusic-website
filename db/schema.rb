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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110401083106) do

  create_table "buylinks", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "release_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.text     "bio"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releases", :force => true do |t|
    t.string   "name"
    t.string   "cover_image"
    t.date     "release_date"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "audio_url"
    t.string   "video_url"
    t.integer  "release_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "description"
    t.string   "agency"
    t.string   "producer"
    t.integer  "video_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "embed_code"
    t.string   "client"
  end

end
