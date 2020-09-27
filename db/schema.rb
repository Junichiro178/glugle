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

ActiveRecord::Schema.define(version: 2020_09_27_052006) do

  create_table "restaurant_cafes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "phonetic_name", null: false
    t.string "phone_number", null: false
    t.string "description", null: false
    t.string "opening_hours", null: false
    t.string "regular_holidays", null: false
    t.integer "prefecture", null: false
    t.string "city_ward", null: false
    t.string "block_number", null: false
    t.string "building_name"
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_restaurant_cafes_on_owner_id"
  end

end
