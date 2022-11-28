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

ActiveRecord::Schema[7.0].define(version: 2022_07_27_142336) do
  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "short_name"
    t.string "website"
    t.text "description"
    t.string "short_description"
    t.string "workflow_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name"
    t.index ["short_name"], name: "index_companies_on_short_name"
    t.index ["workflow_state"], name: "index_companies_on_workflow_state"
  end

  create_table "consultants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "company_id"
    t.string "headline"
    t.boolean "is_public", default: true, null: false
    t.boolean "is_featured", default: false
    t.string "title"
    t.date "birth_date"
    t.date "available_from"
    t.integer "data_completeness"
    t.integer "experience_duration"
    t.date "last_login_at"
    t.date "last_profile_update"
    t.text "specialties"
    t.text "who_am_i"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_consultants_on_company_id"
    t.index ["is_public"], name: "index_consultants_on_is_public"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_featured", default: false
    t.boolean "is_remote", default: false
    t.integer "job_type"
    t.date "closing_date"
    t.text "description"
    t.date "paid_for_posting_until"
    t.date "published_at"
    t.boolean "salary_information_display", default: false, null: false
    t.integer "salary_range_bottom"
    t.integer "salary_range_top"
    t.string "workflow_state"
    t.integer "company_id"
    t.integer "consultant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["consultant_id"], name: "index_jobs_on_consultant_id"
  end
end
