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

ActiveRecord::Schema.define(version: 2019_12_17_151126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.bigint "make_id"
    t.bigint "model_id"
    t.integer "year"
    t.bigint "trim_id"
    t.bigint "style_id"
    t.string "colour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["make_id"], name: "index_cars_on_make_id"
    t.index ["model_id"], name: "index_cars_on_model_id"
    t.index ["style_id"], name: "index_cars_on_style_id"
    t.index ["trim_id"], name: "index_cars_on_trim_id"
  end

  create_table "makes", force: :cascade do |t|
    t.string "make"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "body_style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trims", force: :cascade do |t|
    t.string "trim_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cars", "makes"
  add_foreign_key "cars", "models"
  add_foreign_key "cars", "styles"
  add_foreign_key "cars", "trims"
end
