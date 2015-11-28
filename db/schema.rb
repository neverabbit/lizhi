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

ActiveRecord::Schema.define(version: 20151128095504) do

  create_table "companies", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "introduction", limit: 65535
    t.string   "property",     limit: 255
    t.string   "scale",        limit: 255
    t.string   "address",      limit: 255
    t.string   "founded_at",   limit: 255
    t.string   "keyword",      limit: 255
    t.text     "comment",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "products",     limit: 65535
    t.text     "team",         limit: 65535
    t.string   "stage",        limit: 255
    t.string   "worktime",     limit: 255
    t.string   "realname",     limit: 255
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.string   "position",   limit: 255
    t.string   "company",    limit: 255
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "bonus",          limit: 4
    t.integer  "salary_top",     limit: 4
    t.integer  "salary_bottom",  limit: 4
    t.string   "city",           limit: 255
    t.string   "district",       limit: 255
    t.string   "address",        limit: 255
    t.string   "department",     limit: 255
    t.string   "report_to",      limit: 255
    t.string   "education",      limit: 255
    t.string   "experience",     limit: 255
    t.integer  "age_top",        limit: 4
    t.integer  "age_bottom",     limit: 4
    t.text     "keyword",        limit: 65535
    t.integer  "recommended",    limit: 4
    t.integer  "interviewee",    limit: 4
    t.integer  "entry",          limit: 4
    t.integer  "remaining",      limit: 4
    t.integer  "demanding",      limit: 4
    t.text     "responsibility", limit: 65535
    t.text     "requirement",    limit: 65535
    t.string   "status",         limit: 255
    t.text     "comment",        limit: 65535
    t.string   "consultant",     limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "company_id",     limit: 4
  end

  add_index "positions", ["company_id"], name: "index_positions_on_company_id", using: :btree

  create_table "recommendations", force: :cascade do |t|
    t.integer  "recommender_id", limit: 4
    t.integer  "recommendee_id", limit: 4
    t.integer  "position_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "recommendations", ["position_id", "created_at"], name: "index_recommendations_on_position_id_and_created_at", using: :btree
  add_index "recommendations", ["position_id", "recommender_id", "recommendee_id"], name: "my_index", unique: true, using: :btree
  add_index "recommendations", ["position_id"], name: "index_recommendations_on_position_id", using: :btree
  add_index "recommendations", ["recommendee_id"], name: "index_recommendations_on_recommendee_id", using: :btree
  add_index "recommendations", ["recommender_id"], name: "index_recommendations_on_recommender_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "phone",           limit: 255
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "city",            limit: 255
    t.text     "quality",         limit: 65535
    t.string   "position",        limit: 255
    t.string   "start_year",      limit: 255
    t.string   "birthday",        limit: 255
    t.string   "gender",          limit: 255
    t.string   "marriage",        limit: 255
    t.string   "hometown",        limit: 255
    t.integer  "salary",          limit: 4
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "isadmin"
    t.string   "status",          limit: 255
    t.text     "comment",         limit: 65535
  end

  add_index "users", ["city"], name: "index_users_on_city", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["isadmin"], name: "index_users_on_isadmin", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", using: :btree

  add_foreign_key "positions", "companies"
end
