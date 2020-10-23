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

ActiveRecord::Schema.define(version: 2020_10_23_161414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.integer "experience"
    t.string "timestamps"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.float "admission_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ride_mechanics", id: false, force: :cascade do |t|
    t.bigint "ride_id", null: false
    t.bigint "mechanic_id", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.string "name"
    t.integer "thrill_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "park_id"
  end

  add_foreign_key "ride_mechanics", "mechanics"
  add_foreign_key "ride_mechanics", "rides"
  add_foreign_key "rides", "parks"
end
