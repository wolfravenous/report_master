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

ActiveRecord::Schema.define(version: 20161006161124) do

  create_table "futures", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "futures", ["subject_id"], name: "index_futures_on_subject_id"

  create_table "intros", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "intros", ["subject_id"], name: "index_intros_on_subject_id"

  create_table "reports", force: :cascade do |t|
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "gender"
    t.integer  "subject_id"
    t.decimal  "classwork"
    t.decimal  "assessment"
    t.decimal  "participate"
    t.integer  "unit_id"
    t.integer  "intro_id"
    t.integer  "future_id"
    t.integer  "initial_id"
    t.integer  "ending_id"
    t.boolean  "honor"
    t.boolean  "accel"
    t.boolean  "maxonline"
  end

  add_index "reports", ["ending_id"], name: "index_reports_on_ending_id"
  add_index "reports", ["future_id"], name: "index_reports_on_future_id"
  add_index "reports", ["initial_id"], name: "index_reports_on_initial_id"
  add_index "reports", ["intro_id"], name: "index_reports_on_intro_id"
  add_index "reports", ["subject_id"], name: "index_reports_on_subject_id"
  add_index "reports", ["unit_id"], name: "index_reports_on_unit_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "units", ["subject_id"], name: "index_units_on_subject_id"

end
