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

ActiveRecord::Schema.define(version: 20150628213508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ptexts", force: :cascade do |t|
    t.text     "history"
    t.text     "text"
    t.integer  "number"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ptexts", ["user_id"], name: "index_ptexts_on_user_id", using: :btree

  create_table "stexts", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "ptext_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stexts", ["ptext_id"], name: "index_stexts_on_ptext_id", using: :btree
  add_index "stexts", ["user_id"], name: "index_stexts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "image",           null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "token",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  add_foreign_key "ptexts", "users"
  add_foreign_key "stexts", "ptexts"
  add_foreign_key "stexts", "users"
end
