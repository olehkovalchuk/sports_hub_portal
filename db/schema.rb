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

ActiveRecord::Schema[7.0].define(version: 2023_03_10_200715) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisements", force: :cascade do |t|
    t.string "url", null: false
    t.string "type", default: "site_wide", null: false
    t.string "status", default: "inactive", null: false
    t.bigint "category_id"
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_advertisements_on_author_id"
    t.index ["category_id"], name: "index_advertisements_on_category_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.bigint "survey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_answers_on_survey_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "name", null: false
    t.string "caption", null: false
    t.text "content", null: false
    t.string "picture_text", null: false
    t.string "location"
    t.boolean "main_page", default: true, null: false
    t.boolean "comments", default: true, null: false
    t.string "type", default: "article", null: false
    t.string "url_data"
    t.text "file_data"
    t.bigint "category_id"
    t.bigint "team_id"
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_articles_on_author_id"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["team_id"], name: "index_articles_on_team_id"
  end

  create_table "baners", force: :cascade do |t|
    t.string "name", null: false
    t.string "content", null: false
    t.string "status", default: "not_published", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_baners_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "comment_reactions", force: :cascade do |t|
    t.string "type", null: false
    t.bigint "user_id", null: false
    t.bigint "comment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_reactions_on_comment_id"
    t.index ["user_id"], name: "index_comment_reactions_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "article_id", null: false
    t.bigint "author_id", null: false
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["parent_id"], name: "index_comments_on_parent_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "type", null: false
    t.bigint "category_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subscriptions_on_category_id"
    t.index ["team_id"], name: "index_subscriptions_on_team_id"
  end

  create_table "survey_responders", force: :cascade do |t|
    t.string "responder_answer", null: false
    t.bigint "survey_id", null: false
    t.bigint "responder_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["responder_id"], name: "index_survey_responders_on_responder_id"
    t.index ["survey_id"], name: "index_survey_responders_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.date "due_date"
    t.string "question", null: false
    t.string "status", default: "not_published"
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_surveys_on_author_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", default: "all"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_teams_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "status", default: "active", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "advertisements", "categories"
  add_foreign_key "advertisements", "users", column: "author_id"
  add_foreign_key "answers", "surveys"
  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "teams"
  add_foreign_key "articles", "users", column: "author_id"
  add_foreign_key "baners", "categories"
  add_foreign_key "comment_reactions", "comments"
  add_foreign_key "comment_reactions", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "subscriptions", "categories"
  add_foreign_key "subscriptions", "teams"
  add_foreign_key "survey_responders", "surveys"
  add_foreign_key "survey_responders", "users", column: "responder_id"
  add_foreign_key "surveys", "users", column: "author_id"
  add_foreign_key "teams", "categories"
end
