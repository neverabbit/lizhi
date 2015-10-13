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

ActiveRecord::Schema.define(version: 20151011084359) do

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
  end

end
