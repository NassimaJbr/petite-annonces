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

ActiveRecord::Schema.define(version: 2023_05_09_192420) do

  create_table "articles", force: :cascade do |t|
    t.integer "creator_id"
    t.string "title"
    t.text "text"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id", null: false
    t.decimal "prix_min"
    t.decimal "prix_max"
    t.string "ville"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["creator_id"], name: "index_articles_on_creator_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "priority", null: false
    t.integer "article_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_categories_on_article_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string  "email"  , null: false
    t.string   "password" , null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_votes_on_article_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "users", column: "creator_id"
  add_foreign_key "categories", "articles"
  add_foreign_key "votes", "articles"
  add_foreign_key "votes", "users"
end
