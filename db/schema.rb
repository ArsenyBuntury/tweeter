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

ActiveRecord::Schema[7.0].define(version: 2022_02_21_184053) do
  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "twit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["twit_id"], name: "index_comments_on_twit_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "subcomments", force: :cascade do |t|
    t.string "body"
    t.string "commentable_type", null: false
    t.integer "commentable_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_subcomments_on_commentable"
    t.index ["user_id"], name: "index_subcomments_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twit_tags", force: :cascade do |t|
    t.integer "twit_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_twit_tags_on_tag_id"
    t.index ["twit_id", "tag_id"], name: "index_twit_tags_on_twit_id_and_tag_id", unique: true
    t.index ["twit_id"], name: "index_twit_tags_on_twit_id"
  end

  create_table "twits", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_twits_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_token_digest"
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "comments", "twits"
  add_foreign_key "comments", "users"
  add_foreign_key "subcomments", "comments", column: "user_id"
  add_foreign_key "twit_tags", "tags"
  add_foreign_key "twit_tags", "twits"
  add_foreign_key "twits", "users"
end
