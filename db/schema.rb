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

ActiveRecord::Schema.define(version: 2022_05_12_211454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.boolean "has_rope"
    t.integer "square_feet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rope_routes", force: :cascade do |t|
    t.string "grade"
    t.string "color"
    t.boolean "top_rope"
    t.boolean "lead"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gym_id"
    t.index ["gym_id"], name: "index_rope_routes_on_gym_id"
  end

  add_foreign_key "rope_routes", "gyms"
end
