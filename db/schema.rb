# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2015_05_17_231848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dataset_vars", force: :cascade do |t|
    t.string "filename", null: false
    t.string "sheetname", null: false
    t.string "fmr0", null: false
    t.string "fmr1", null: false
    t.string "fmr2", null: false
    t.string "fmr3", null: false
    t.string "fmr4", null: false
    t.string "metro_code", null: false
    t.string "area_name", null: false
    t.string "state", null: false
    t.string "metro_area", null: false
    t.integer "fmr_dataset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fmr_dataset_id"], name: "index_dataset_vars_on_fmr_dataset_id"
  end

  create_table "fair_mkt_rents", force: :cascade do |t|
    t.string "fmr0", null: false
    t.string "fmr1", null: false
    t.string "fmr2", null: false
    t.string "fmr3", null: false
    t.string "fmr4", null: false
    t.string "metro_code", null: false
    t.string "year", null: false
    t.integer "fmr_dataset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fmr_dataset_id"], name: "index_fair_mkt_rents_on_fmr_dataset_id"
    t.index ["metro_code"], name: "index_fair_mkt_rents_on_metro_code"
    t.index ["year"], name: "index_fair_mkt_rents_on_year"
  end

  create_table "fmr_areas", force: :cascade do |t|
    t.string "metro_code", null: false
    t.string "state", limit: 2, null: false
    t.string "area_name", null: false
    t.boolean "metro_area", null: false
    t.string "year", null: false
    t.integer "fmr_dataset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fmr_dataset_id"], name: "index_fmr_areas_on_fmr_dataset_id"
    t.index ["state"], name: "index_fmr_areas_on_state"
    t.index ["year"], name: "index_fmr_areas_on_year"
  end

  create_table "fmr_datasets", force: :cascade do |t|
    t.string "requested_by", null: false
    t.string "data_year", null: false
    t.string "method", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dataset_vars", "fmr_datasets"
  add_foreign_key "fair_mkt_rents", "fmr_datasets"
  add_foreign_key "fmr_areas", "fmr_datasets"
end
