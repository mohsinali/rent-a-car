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

ActiveRecord::Schema.define(version: 20171010065537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.bigint "make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["make_id"], name: "index_car_models_on_make_id"
  end

  create_table "car_photos", force: :cascade do |t|
    t.string "image"
    t.integer "image_type", default: 0
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_versions", force: :cascade do |t|
    t.string "name"
    t.bigint "car_model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_model_id"], name: "index_car_versions_on_car_model_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "registration_no"
    t.integer "mileage"
    t.date "last_oil_change"
    t.integer "per_day_rent"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "car_version_id"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "role"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "car_models", "makes"
  add_foreign_key "car_versions", "car_models"
  add_foreign_key "cars", "users"
end
