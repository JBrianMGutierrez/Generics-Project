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

ActiveRecord::Schema.define(version: 2018_04_24_142444) do

  create_table "accomplishments", force: :cascade do |t|
    t.integer "profile_id"
    t.string "title"
    t.string "type_of_award"
    t.date "date_of_award"
    t.text "award_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_accomplishments_on_profile_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.integer "accomplishment_id"
    t.string "award_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accomplishment_id"], name: "index_pictures_on_accomplishment_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "profile_picture"
    t.date "date_of_birth"
    t.string "civil_status"
    t.string "gender"
    t.string "contact_number"
    t.string "education"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "biography"
    t.string "location_city"
    t.string "main_skill"
    t.string "main_hobby"
    t.string "education_status"
    t.string "interest"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.integer "profile_id"
    t.string "speaker"
    t.date "date_of_training"
    t.string "type_of_training"
    t.string "certificate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "price"
    t.text "training_description"
    t.index ["profile_id"], name: "index_trainings_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "approved", default: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
