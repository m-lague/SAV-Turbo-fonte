# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_13_124615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alarms", force: :cascade do |t|
    t.text "description"
    t.bigint "error_codes_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["error_codes_id"], name: "index_alarms_on_error_codes_id"
  end

  create_table "alarms_leds", force: :cascade do |t|
    t.bigint "led_id", null: false
    t.bigint "alarm_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alarm_id"], name: "index_alarms_leds_on_alarm_id"
    t.index ["led_id"], name: "index_alarms_leds_on_led_id"
  end

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "error_codes", force: :cascade do |t|
    t.string "number"
    t.integer "code_log"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leds", force: :cascade do |t|
    t.string "icon"
    t.string "color"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phases", force: :cascade do |t|
    t.string "name"
    t.text "goal"
    t.string "charge"
    t.boolean "heating_system"
    t.boolean "smoke_extractor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "problems", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stoves", force: :cascade do |t|
    t.string "name"
    t.string "rated_heat_output"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "task_todo_lists", id: false, force: :cascade do |t|
    t.bigint "todo_list_id", null: false
    t.bigint "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_id"], name: "index_task_todo_lists_on_task_id"
    t.index ["todo_list_id"], name: "index_task_todo_lists_on_todo_list_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "todo_lists", force: :cascade do |t|
    t.integer "to_do_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alarms", "error_codes", column: "error_codes_id"
  add_foreign_key "alarms_leds", "alarms"
  add_foreign_key "alarms_leds", "leds"
end
