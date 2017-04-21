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

ActiveRecord::Schema.define(version: 20170420233533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id_id"
    t.integer  "friend_id_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["friend_id_id"], name: "index_friendships_on_friend_id_id", using: :btree
    t.index ["user_id_id"], name: "index_friendships_on_user_id_id", using: :btree
  end

  create_table "friendsrequests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friendsrequests_on_user_id", using: :btree
  end

  create_table "game_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_tags_on_game_id", using: :btree
    t.index ["tag_id"], name: "index_game_tags_on_tag_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "players",     null: false
    t.string   "age",         null: false
    t.string   "play_time",   null: false
    t.integer  "complexity",  null: false
    t.string   "publisher",   null: false
    t.string   "img_url"
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_reviews_on_game_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

<<<<<<< HEAD
=======
  create_table "votes", force: :cascade do |t|
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.integer  "user_id"
    t.integer  "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id", using: :btree
  end

>>>>>>> 862634c183c6d76020eb29c4c6ba4877c58fea7d
  add_foreign_key "friendsrequests", "users"
end
