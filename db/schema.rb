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

ActiveRecord::Schema.define(version: 20150409051528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fair_mkt_rents", force: :cascade do |t|
    t.integer  "fmr0",            null: false
    t.integer  "fmr1",            null: false
    t.integer  "fmr2",            null: false
    t.integer  "fmr3",            null: false
    t.integer  "fmr4",            null: false
    t.string   "metro_code",      null: false
    t.integer  "year",            null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "transactions_id"
  end

  add_index "fair_mkt_rents", ["metro_code"], name: "index_fair_mkt_rents_on_metro_code", using: :btree
  add_index "fair_mkt_rents", ["year"], name: "index_fair_mkt_rents_on_year", using: :btree

  create_table "fmr_areas", force: :cascade do |t|
    t.string   "metro_code",                null: false
    t.string   "state",           limit: 2, null: false
    t.string   "area_name",                 null: false
    t.boolean  "metro_area",                null: false
    t.integer  "year",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "transactions_id"
  end

  add_index "fmr_areas", ["state"], name: "index_fmr_areas_on_state", using: :btree
  add_index "fmr_areas", ["year"], name: "index_fmr_areas_on_year", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.string   "requested_by", null: false
    t.string   "data_year",    null: false
    t.string   "method",       null: false
    t.string   "filename",     null: false
    t.string   "description",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
