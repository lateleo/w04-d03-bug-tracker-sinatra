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

ActiveRecord::Schema.define(version: 11) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "insects", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.integer "researcher_id"
  end

  create_table "insects_locations", id: false, force: :cascade do |t|
    t.integer "insect_id",   null: false
    t.integer "location_id", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
  end

  create_table "papers", force: :cascade do |t|
    t.integer "researcher_id"
    t.integer "insect_id"
    t.string  "title"
    t.text    "text"
  end

  create_table "researchers", force: :cascade do |t|
    t.string  "name"
    t.integer "age"
  end

end
