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

ActiveRecord::Schema[7.0].define(version: 2023_04_19_154358) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.text "description"
    t.date "start_date", default: -> { "CURRENT_TIMESTAMP" }
    t.date "end_date", default: -> { "CURRENT_TIMESTAMP" }
    t.string "status", limit: 20, default: "pending"
    t.integer "agreed_amount", default: 0
    t.bigint "project_id", null: false
    t.bigint "client_id", null: false
    t.bigint "freelancer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_contracts_on_client_id"
    t.index ["freelancer_id"], name: "index_contracts_on_freelancer_id"
    t.index ["project_id"], name: "index_contracts_on_project_id"
  end

  create_table "payment_details", force: :cascade do |t|
    t.string "method", limit: 100
    t.string "uid", default: "", null: false
    t.integer "amount", default: 0
    t.string "status", limit: 20, default: "pending"
    t.date "date", default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "contract_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_payment_details_on_contract_id"
  end

  create_table "project_proposals", force: :cascade do |t|
    t.text "description"
    t.integer "bid_amount", default: 0
    t.string "status", limit: 20, default: "pending"
    t.bigint "project_id", null: false
    t.bigint "client_id", null: false
    t.bigint "freelancer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_project_proposals_on_client_id"
    t.index ["freelancer_id"], name: "index_project_proposals_on_freelancer_id"
    t.index ["project_id"], name: "index_project_proposals_on_project_id"
  end

  create_table "project_tags", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_tags_on_project_id"
    t.index ["skill_id"], name: "index_project_tags_on_skill_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", limit: 100
    t.text "description"
    t.string "location", limit: 100
    t.string "project_type", limit: 20
    t.integer "budget"
    t.integer "duration"
    t.string "status", limit: 20, default: "pending"
    t.date "deadline"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "text"
    t.integer "rating", default: 0
    t.bigint "reviewer_id"
    t.bigint "reviewee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contract_id", null: false
    t.index ["contract_id"], name: "index_reviews_on_contract_id"
    t.index ["reviewee_id"], name: "index_reviews_on_reviewee_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", limit: 100
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_experience_tags", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "experience_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_tag_id"], name: "index_user_experience_tags_on_experience_tag_id"
    t.index ["user_id"], name: "index_user_experience_tags_on_user_id"
  end

  create_table "user_profile_details", force: :cascade do |t|
    t.string "street"
    t.string "country"
    t.string "district"
    t.integer "age"
    t.integer "experience"
    t.string "national_id"
    t.string "passport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["experience"], name: "index_user_profile_details_on_experience", unique: true
    t.index ["user_id"], name: "index_user_profile_details_on_user_id"
  end

  create_table "user_social_media", force: :cascade do |t|
    t.string "media_type", limit: 20
    t.string "url", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_user_social_media_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.string "account_type", limit: 20, default: "user"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "contracts", "projects"
  add_foreign_key "contracts", "users", column: "client_id"
  add_foreign_key "contracts", "users", column: "freelancer_id"
  add_foreign_key "payment_details", "contracts"
  add_foreign_key "project_proposals", "projects"
  add_foreign_key "project_proposals", "users", column: "client_id"
  add_foreign_key "project_proposals", "users", column: "freelancer_id"
  add_foreign_key "project_tags", "projects"
  add_foreign_key "project_tags", "skills"
  add_foreign_key "projects", "users", column: "client_id"
  add_foreign_key "reviews", "contracts"
  add_foreign_key "reviews", "users", column: "reviewee_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "user_experience_tags", "skills", column: "experience_tag_id"
  add_foreign_key "user_experience_tags", "users"
  add_foreign_key "user_profile_details", "users"
  add_foreign_key "user_social_media", "users"
end
