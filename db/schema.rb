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

ActiveRecord::Schema.define(version: 2019_07_16_020315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", primary_key: "course_id", force: :cascade do |t|
    t.string "name"
    t.integer "fee", default: 0
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.string "cover"
    t.text "requirement"
    t.text "aim"
    t.string "category", default: "Miscellaneous"
  end

  create_table "students", primary_key: "student_id", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.integer "budget"
    t.date "dateofBirth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "teacher", default: false
    t.string "avatar"
    t.index ["email"], name: "index_students_on_email", unique: true
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "subscriber_id"
    t.integer "subscribed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscribed_id"], name: "index_subscriptions_on_subscribed_id"
    t.index ["subscriber_id", "subscribed_id"], name: "index_subscriptions_on_subscriber_id_and_subscribed_id", unique: true
    t.index ["subscriber_id"], name: "index_subscriptions_on_subscriber_id"
  end

  add_foreign_key "courses", "students", primary_key: "student_id"
end
