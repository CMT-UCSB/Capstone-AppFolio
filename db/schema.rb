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

ActiveRecord::Schema.define(version: 2021_01_31_001812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "employee_surveys", force: :cascade do |t|
    t.uuid "employee_id"
    t.uuid "survey_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employee_surveys_on_employee_id"
    t.index ["survey_id"], name: "index_employee_surveys_on_survey_id"
  end

  create_table "employees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.bigint "manager_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manager_id"], name: "index_employees_on_manager_id"
  end

  create_table "entity_nlps", force: :cascade do |t|
    t.string "name"
    t.integer "count"
    t.decimal "sentiment_score"
    t.decimal "sentiment_mag"
    t.decimal "salience_score"
    t.uuid "survey_id"
    t.bigint "open_ended_response_id"
    t.index ["open_ended_response_id"], name: "index_entity_nlps_on_open_ended_response_id"
    t.index ["survey_id"], name: "index_entity_nlps_on_survey_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "mood_responses", force: :cascade do |t|
    t.integer "response"
    t.integer "elapsed_weeks"
    t.bigint "question_id"
    t.uuid "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_mood_responses_on_employee_id"
    t.index ["question_id"], name: "index_mood_responses_on_question_id"
  end

  create_table "notes", force: :cascade do |t|
    t.date "date"
    t.text "content"
    t.bigint "manager_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_notes_on_created_at"
    t.index ["manager_id"], name: "index_notes_on_manager_id"
  end

  create_table "open_ended_responses", force: :cascade do |t|
    t.string "response"
    t.integer "elapsed_weeks"
    t.bigint "question_id"
    t.uuid "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_open_ended_responses_on_employee_id"
    t.index ["question_id"], name: "index_open_ended_responses_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "prompt"
    t.integer "question_type"
    t.uuid "survey_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_questions_on_created_at"
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "surveys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "interval"
    t.time "time_of_day"
    t.integer "day_of_week"
    t.integer "isAnonymous"
    t.bigint "manager_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manager_id"], name: "index_surveys_on_manager_id"
  end

end
