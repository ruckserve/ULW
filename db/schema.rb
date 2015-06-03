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

ActiveRecord::Schema.define(version: 20150517231848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dataset_vars", force: :cascade do |t|
    t.string   "filename",       null: false
    t.string   "sheetname",      null: false
    t.string   "fmr0",           null: false
    t.string   "fmr1",           null: false
    t.string   "fmr2",           null: false
    t.string   "fmr3",           null: false
    t.string   "fmr4",           null: false
    t.string   "metro_code",     null: false
    t.string   "area_name",      null: false
    t.string   "state",          null: false
    t.string   "metro_area",     null: false
    t.integer  "fmr_dataset_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "dataset_vars", ["fmr_dataset_id"], name: "index_dataset_vars_on_fmr_dataset_id", using: :btree

  create_table "fair_mkt_rents", force: :cascade do |t|
    t.string   "fmr0",           null: false
    t.string   "fmr1",           null: false
    t.string   "fmr2",           null: false
    t.string   "fmr3",           null: false
    t.string   "fmr4",           null: false
    t.string   "metro_code",     null: false
    t.string   "year",           null: false
    t.integer  "fmr_dataset_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "fair_mkt_rents", ["fmr_dataset_id"], name: "index_fair_mkt_rents_on_fmr_dataset_id", using: :btree
  add_index "fair_mkt_rents", ["metro_code"], name: "index_fair_mkt_rents_on_metro_code", using: :btree
  add_index "fair_mkt_rents", ["year"], name: "index_fair_mkt_rents_on_year", using: :btree

  create_table "fmr_areas", force: :cascade do |t|
    t.string   "metro_code",               null: false
    t.string   "state",          limit: 2, null: false
    t.string   "area_name",                null: false
    t.boolean  "metro_area",               null: false
    t.string   "year",                     null: false
    t.integer  "fmr_dataset_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "fmr_areas", ["fmr_dataset_id"], name: "index_fmr_areas_on_fmr_dataset_id", using: :btree
  add_index "fmr_areas", ["state"], name: "index_fmr_areas_on_state", using: :btree
  add_index "fmr_areas", ["year"], name: "index_fmr_areas_on_year", using: :btree

  create_table "fmr_datasets", force: :cascade do |t|
    t.string   "requested_by", null: false
    t.string   "data_year",    null: false
    t.string   "method",       null: false
    t.string   "description",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "dataset_vars", "fmr_datasets"
  add_foreign_key "fair_mkt_rents", "fmr_datasets"
  add_foreign_key "fmr_areas", "fmr_datasets"
end
