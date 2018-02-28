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

ActiveRecord::Schema.define(version: 20180228031721) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auctions", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.float    "minimum_price"
    t.datetime "auction_end"
    t.integer  "address_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "status"
  end

  add_index "auctions", ["address_id"], name: "index_auctions_on_address_id"
  add_index "auctions", ["user_id"], name: "index_auctions_on_user_id"

  create_table "bids", force: :cascade do |t|
    t.float    "price"
    t.integer  "user_id"
    t.integer  "auction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bids", ["auction_id"], name: "index_bids_on_auction_id"
  add_index "bids", ["user_id"], name: "index_bids_on_user_id"

  create_table "deliveries", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.datetime "delivery_start"
    t.datetime "delivery_end"
    t.string   "status"
    t.integer  "users_id"
    t.integer  "address_id"
    t.integer  "auction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "deliveries", ["address_id"], name: "index_deliveries_on_address_id"
  add_index "deliveries", ["auction_id"], name: "index_deliveries_on_auction_id"
  add_index "deliveries", ["users_id"], name: "index_deliveries_on_users_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "occupation"
    t.string   "phone_number"
    t.integer  "level"
    t.integer  "address_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id"

end
