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

ActiveRecord::Schema.define(version: 2020_04_15_085622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alarm_probably_causes", force: :cascade do |t|
    t.bigint "probably_cause_id", null: false
    t.bigint "alarm_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alarm_id"], name: "index_alarm_probably_causes_on_alarm_id"
    t.index ["probably_cause_id"], name: "index_alarm_probably_causes_on_probably_cause_id"
  end

  create_table "alarms", force: :cascade do |t|
    t.text "description"
    t.bigint "error_code_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["error_code_id"], name: "index_alarms_on_error_code_id"
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

  create_table "diagnostics", force: :cascade do |t|
    t.bigint "alarm_id", null: false
    t.bigint "stove_id", null: false
    t.bigint "component_id", null: false
    t.bigint "problem_id", null: false
    t.bigint "phase_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alarm_id"], name: "index_diagnostics_on_alarm_id"
    t.index ["component_id"], name: "index_diagnostics_on_component_id"
    t.index ["phase_id"], name: "index_diagnostics_on_phase_id"
    t.index ["problem_id"], name: "index_diagnostics_on_problem_id"
    t.index ["stove_id"], name: "index_diagnostics_on_stove_id"
  end

  create_table "displayed_diagnostics", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "diagnostic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diagnostic_id"], name: "index_displayed_diagnostics_on_diagnostic_id"
    t.index ["user_id"], name: "index_displayed_diagnostics_on_user_id"
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
    t.integer "duration"
    t.bigint "stove_id"
    t.index ["stove_id"], name: "index_phases_on_stove_id"
  end

  create_table "probably_causes", force: :cascade do |t|
    t.text "description"
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
    t.bigint "diagnostic_id"
    t.index ["diagnostic_id"], name: "index_tickets_on_diagnostic_id"
  end

  create_table "todo_lists", force: :cascade do |t|
    t.integer "to_do_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "diagnostic_id"
    t.index ["diagnostic_id"], name: "index_todo_lists_on_diagnostic_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "company"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alarm_probably_causes", "alarms"
  add_foreign_key "alarm_probably_causes", "probably_causes"
  add_foreign_key "alarms", "error_codes"
  add_foreign_key "alarms_leds", "alarms"
  add_foreign_key "alarms_leds", "leds"
  add_foreign_key "diagnostics", "alarms"
  add_foreign_key "diagnostics", "components"
  add_foreign_key "diagnostics", "phases"
  add_foreign_key "diagnostics", "problems"
  add_foreign_key "diagnostics", "stoves", column: "stove_id"
  add_foreign_key "displayed_diagnostics", "diagnostics"
  add_foreign_key "displayed_diagnostics", "users"
  add_foreign_key "phases", "stoves", column: "stove_id"
  add_foreign_key "tickets", "diagnostics"
  add_foreign_key "todo_lists", "diagnostics"
end
