# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_26_114311) do
  create_table "activities", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "trackable_type", null: false
    t.integer "trackable_id", null: false
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "booking_id"
    t.date "booking_date"
    t.integer "user_id", null: false
    t.integer "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_bookings_on_lesson_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "lesson_id"
    t.string "teaching_language"
    t.string "known_language"
    t.string "available_days"
    t.string "meeting_platform"
    t.string "level"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  add_foreign_key "activities", "users"
  add_foreign_key "bookings", "lessons"
  add_foreign_key "bookings", "users"
  add_foreign_key "lessons", "users"
end
