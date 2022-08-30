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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_113028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "castles", force: :cascade do |t|
    t.string "address"
    t.integer "capacity"
    t.boolean "has_internet"
    t.boolean "has_butlers"
    t.boolean "has_swimming_pool"
    t.integer "price"
    t.boolean "has_horses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "host_id", null: false
    t.string "name"
    t.index ["host_id"], name: "index_castles_on_host_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "check_in"
    t.date "check_out"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "guest_id", null: false
    t.bigint "castle_id", null: false
    t.index ["castle_id"], name: "index_reservations_on_castle_id"
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "castles", "users", column: "host_id"
  add_foreign_key "reservations", "castles"
  add_foreign_key "reservations", "users", column: "guest_id"
  add_foreign_key "reviews", "reservations"
end
