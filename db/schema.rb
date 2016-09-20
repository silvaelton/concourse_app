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

ActiveRecord::Schema.define(version: 20160920153710) do

  create_table "bills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consults", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "content"
    t.integer  "situation",  default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "consults", ["project_id"], name: "index_consults_on_project_id"

  create_table "informs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "navs", force: :cascade do |t|
    t.integer  "project_id"
    t.boolean  "self_open",  default: false
    t.boolean  "is_page",    default: true
    t.string   "href"
    t.integer  "page_id"
    t.string   "label"
    t.boolean  "publish",    default: true
    t.integer  "order"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "navs", ["page_id"], name: "index_navs_on_page_id"
  add_index "navs", ["project_id"], name: "index_navs_on_project_id"

  create_table "pages", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "publish",    default: true
    t.string   "slug"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "pages", ["project_id"], name: "index_pages_on_project_id"
  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true

  create_table "participation_fields", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "popups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "main_page_id"
    t.date     "start"
    t.date     "end"
    t.date     "consult_start"
    t.date     "consult_end"
    t.text     "consult_text"
    t.boolean  "consult_publish",       default: false
    t.date     "subscribe_start"
    t.date     "subscribe_end"
    t.boolean  "subscribe_publish",     default: false
    t.date     "participation_start"
    t.date     "participation_end"
    t.boolean  "participation_publish", default: false
    t.date     "result_date"
    t.time     "result_hour"
    t.boolean  "result_publish",        default: false
    t.string   "result_document"
    t.boolean  "page_projects_allow",   default: false
    t.string   "slug"
    t.integer  "situation",             default: 0
    t.string   "banner"
    t.string   "avatar"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "header_color"
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true

  create_table "resources", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribe_professionals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_logs", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_logs", ["user_id"], name: "index_user_logs_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.integer  "privilege",  default: 0
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
