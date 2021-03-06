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

ActiveRecord::Schema.define(version: 20160611165225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "cardId"
    t.string   "name"
    t.string   "cardSet"
    t.string   "type"
    t.string   "faction"
    t.string   "rarity"
    t.integer  "cost"
    t.integer  "attack"
    t.integer  "health"
    t.integer  "durability"
    t.string   "text"
    t.string   "inPlayText"
    t.string   "flavor"
    t.string   "artist"
    t.boolean  "collectible"
    t.boolean  "elite"
    t.string   "race"
    t.string   "playerClass"
    t.string   "howToGet"
    t.string   "howToGetGold"
    t.string   "img"
    t.string   "imgGold"
    t.string   "locale"
    t.text     "mechanics",       default: [],              array: true
    t.text     "classes",         default: [],              array: true
    t.string   "multiClassGroup"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "deck_cards", force: :cascade do |t|
    t.integer  "deck_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string   "title",      default: ""
    t.integer  "user_id"
    t.text     "cards",      default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["user_id"], name: "index_decks_on_user_id", using: :btree
  end

  create_table "saved_cards", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "api_key"
    t.index ["api_key"], name: "index_users_on_api_key", unique: true, using: :btree
  end

end
