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

ActiveRecord::Schema.define(version: 20150613180918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "place",      null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "bc_product_id", null: false
    t.string   "status",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["activity_id"], name: "index_products_on_activity_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "activity_id"
    t.text     "gearhead_review", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["activity_id"], name: "index_reviews_on_activity_id", using: :btree

end
