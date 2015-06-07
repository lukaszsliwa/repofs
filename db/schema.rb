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

ActiveRecord::Schema.define(version: 20150607114908) do

  create_table "newsletters", force: :cascade do |t|
    t.string   "email"
    t.datetime "confirmed_at"
    t.datetime "canceled_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "newsletters", ["confirmed_at", "canceled_at"], name: "index_newsletters_on_confirmed_at_and_canceled_at"
  add_index "newsletters", ["email"], name: "index_newsletters_on_email", unique: true

  create_table "nodes", force: :cascade do |t|
    t.string   "name"
    t.string   "ip"
    t.string   "domain"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "created_by_id"
  end

  add_index "nodes", ["domain"], name: "index_nodes_on_domain", unique: true
  add_index "nodes", ["ip"], name: "index_nodes_on_ip"

  create_table "user_nodes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_nodes", ["user_id", "node_id"], name: "index_user_nodes_on_user_id_and_node_id", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
