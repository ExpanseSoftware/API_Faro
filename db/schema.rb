# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170314153057) do

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "user_name"
    t.string   "user_lastname"
    t.string   "user_second_lastname"
    t.string   "user_email"
    t.date     "user_birthdate"
    t.string   "user_gender"
    t.string   "password_digest"
    t.string   "token"
    t.boolean  "user_active"
    t.string   "active_account_token"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  create_table "branch_promotion_relations", force: :cascade do |t|
    t.integer  "branch_id"
    t.integer  "promotion_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["branch_id"], name: "index_branch_promotion_relations_on_branch_id"
    t.index ["promotion_id"], name: "index_branch_promotion_relations_on_promotion_id"
  end

  create_table "branch_types", force: :cascade do |t|
    t.string   "branch_type_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "branches", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "branch_type_id"
    t.boolean  "branch_active"
    t.boolean  "branch_promotion_status"
    t.string   "branch_address"
    t.string   "branch_coordinates"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["branch_type_id"], name: "index_branches_on_branch_type_id"
    t.index ["company_id"], name: "index_branches_on_company_id"
  end

  create_table "branches_products", force: :cascade do |t|
    t.integer  "branch_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_branches_products_on_branch_id"
    t.index ["product_id"], name: "index_branches_products_on_product_id"
  end

  create_table "branches_services", force: :cascade do |t|
    t.integer  "branch_id"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_branches_services_on_branch_id"
    t.index ["service_id"], name: "index_branches_services_on_service_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.text     "category_description"
    t.boolean  "category_active"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "company_type_id"
    t.string   "company_name"
    t.text     "company_description"
    t.boolean  "company_active"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["category_id"], name: "index_companies_on_category_id"
    t.index ["company_type_id"], name: "index_companies_on_company_type_id"
  end

  create_table "company_types", force: :cascade do |t|
    t.string   "company_type_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "phone_types", force: :cascade do |t|
    t.string   "phone_type_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "phone_type_id"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.string   "phone_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_phones_on_imageable_type_and_imageable_id"
    t.index ["phone_type_id"], name: "index_phones_on_phone_type_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "product_name"
    t.text     "product_description"
    t.float    "product_price"
    t.boolean  "product_active"
    t.integer  "product_sold_quantity"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "promo_relations", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "branch_id"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["branch_id"], name: "index_promo_relations_on_branch_id"
    t.index ["imageable_type", "imageable_id"], name: "index_promo_relations_on_imageable_type_and_imageable_id"
    t.index ["promotion_id"], name: "index_promo_relations_on_promotion_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "promotion_name"
    t.text     "promotion_description"
    t.boolean  "promotion_active"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["company_id"], name: "index_promotions_on_company_id"
  end

  create_table "services", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "service_name"
    t.text     "service_description"
    t.boolean  "service_active"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["company_id"], name: "index_services_on_company_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "user_status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["company_id"], name: "index_user_types_on_company_id"
    t.index ["user_id"], name: "index_user_types_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "user_first_lastname"
    t.string   "user_second_lastname"
    t.string   "user_nickname"
    t.string   "user_password"
    t.string   "user_gender"
    t.string   "user_token"
    t.datetime "user_birthday"
    t.string   "user_birthplace"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
