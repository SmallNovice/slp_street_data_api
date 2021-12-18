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

ActiveRecord::Schema.define(version: 2021_12_18_162231) do

  create_table "categories", force: :cascade do |t|
    t.string "current_project_name"
    t.string "project_level"
    t.string "last_project_name"
    t.integer "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_categories_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "department_name"
    t.string "category_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "current_project_name"
    t.integer "project_level"
    t.integer "current_year"
    t.integer "current_number"
    t.integer "before_last_year"
    t.integer "before_last_year_number"
    t.integer "last_year_number"
    t.integer "last_year_number_number"
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_projects_on_category_id"
  end

  create_table "quarter_tables", force: :cascade do |t|
    t.integer "current_year"
    t.string "first_quarter"
    t.string "second_quarter"
    t.string "third_quarter"
    t.integer "curruent_month"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_quarter_tables_on_project_id"
  end

  add_foreign_key "categories", "departments"
  add_foreign_key "projects", "categories"
  add_foreign_key "quarter_tables", "projects"
end
