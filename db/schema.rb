# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160607045216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendance_rates", force: :cascade do |t|
    t.string   "name"
    t.float    "rate"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendance_rates", ["tenant_id"], name: "index_attendance_rates_on_tenant_id", using: :btree

  create_table "attendances", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "client_id"
    t.integer  "attendance_rate_id"
    t.integer  "tenant_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "attendances", ["attendance_rate_id"], name: "index_attendances_on_attendance_rate_id", using: :btree
  add_index "attendances", ["client_id"], name: "index_attendances_on_client_id", using: :btree
  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id", using: :btree
  add_index "attendances", ["tenant_id"], name: "index_attendances_on_tenant_id", using: :btree

  create_table "attr1s", force: :cascade do |t|
    t.string   "name"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attr1s", ["tenant_id"], name: "index_attr1s_on_tenant_id", using: :btree

  create_table "attr2s", force: :cascade do |t|
    t.string   "name"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attr2s", ["tenant_id"], name: "index_attr2s_on_tenant_id", using: :btree

  create_table "attr3s", force: :cascade do |t|
    t.string   "name"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attr3s", ["tenant_id"], name: "index_attr3s_on_tenant_id", using: :btree

  create_table "cash_collections", force: :cascade do |t|
    t.integer  "office_id"
    t.float    "amount"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cash_collections", ["office_id"], name: "index_cash_collections_on_office_id", using: :btree
  add_index "cash_collections", ["tenant_id"], name: "index_cash_collections_on_tenant_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "tel1"
    t.string   "tel2"
    t.date     "dob"
    t.string   "sex"
    t.string   "address"
    t.integer  "lead_source_id"
    t.integer  "tenant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "clients", ["tenant_id"], name: "index_clients_on_tenant_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_id"
    t.integer  "attr1_id"
    t.integer  "attr2_id"
    t.integer  "attr3_id"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses", ["tenant_id"], name: "index_courses_on_tenant_id", using: :btree

  create_table "enrollments", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "client_id"
    t.integer  "tenant_id"
    t.integer  "member_id"
    t.integer  "coupon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrollments", ["client_id"], name: "index_enrollments_on_client_id", using: :btree
  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id", using: :btree
  add_index "enrollments", ["member_id"], name: "index_enrollments_on_member_id", using: :btree
  add_index "enrollments", ["tenant_id"], name: "index_enrollments_on_tenant_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.datetime "starts_at"
    t.integer  "room_id"
    t.integer  "member_id"
    t.integer  "course_id"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["course_id"], name: "index_events_on_course_id", using: :btree
  add_index "events", ["member_id"], name: "index_events_on_member_id", using: :btree
  add_index "events", ["tenant_id"], name: "index_events_on_tenant_id", using: :btree

  create_table "expences", force: :cascade do |t|
    t.integer  "member_id"
    t.decimal  "amount"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "expences", ["member_id"], name: "index_expences_on_member_id", using: :btree
  add_index "expences", ["tenant_id"], name: "index_expences_on_tenant_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.integer  "tenant_id"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["tenant_id"], name: "index_members_on_tenant_id", using: :btree
  add_index "members", ["user_id"], name: "index_members_on_user_id", using: :btree

  create_table "offices", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "tel"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "offices", ["tenant_id"], name: "index_offices_on_tenant_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount"
    t.string   "payment_type"
    t.integer  "enrollment_id"
    t.integer  "office_id"
    t.integer  "member_id"
    t.integer  "tenant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "payments", ["enrollment_id"], name: "index_payments_on_enrollment_id", using: :btree
  add_index "payments", ["member_id"], name: "index_payments_on_member_id", using: :btree
  add_index "payments", ["office_id"], name: "index_payments_on_office_id", using: :btree
  add_index "payments", ["tenant_id"], name: "index_payments_on_tenant_id", using: :btree

  create_table "product_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_types", ["tenant_id"], name: "index_product_types_on_tenant_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_quantity"
    t.integer  "event_length"
    t.decimal  "member_price"
    t.decimal  "client_price"
    t.string   "gtype"
    t.string   "ctype"
    t.boolean  "is_active"
    t.integer  "product_type_id"
    t.integer  "tenant_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "products", ["product_type_id"], name: "index_products_on_product_type_id", using: :btree
  add_index "products", ["tenant_id"], name: "index_products_on_tenant_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "office_id"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rooms", ["office_id"], name: "index_rooms_on_office_id", using: :btree
  add_index "rooms", ["tenant_id"], name: "index_rooms_on_tenant_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "tenants", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "plan"
  end

  add_index "tenants", ["name"], name: "index_tenants_on_name", using: :btree
  add_index "tenants", ["tenant_id"], name: "index_tenants_on_tenant_id", using: :btree

  create_table "tenants_users", id: false, force: :cascade do |t|
    t.integer "tenant_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "tenants_users", ["tenant_id", "user_id"], name: "index_tenants_users_on_tenant_id_and_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                        default: "",    null: false
    t.string   "encrypted_password",           default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "skip_confirm_change_password", default: false
    t.integer  "tenant_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "is_admin",                     default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "attendance_rates", "tenants"
  add_foreign_key "attendances", "attendance_rates"
  add_foreign_key "attendances", "clients"
  add_foreign_key "attendances", "events"
  add_foreign_key "attendances", "tenants"
  add_foreign_key "attr1s", "tenants"
  add_foreign_key "attr2s", "tenants"
  add_foreign_key "attr3s", "tenants"
  add_foreign_key "cash_collections", "offices"
  add_foreign_key "cash_collections", "tenants"
  add_foreign_key "clients", "tenants"
  add_foreign_key "courses", "tenants"
  add_foreign_key "enrollments", "clients"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "members"
  add_foreign_key "enrollments", "tenants"
  add_foreign_key "events", "courses"
  add_foreign_key "events", "members"
  add_foreign_key "events", "tenants"
  add_foreign_key "expences", "members"
  add_foreign_key "expences", "tenants"
  add_foreign_key "members", "tenants"
  add_foreign_key "members", "users"
  add_foreign_key "offices", "tenants"
  add_foreign_key "payments", "enrollments"
  add_foreign_key "payments", "members"
  add_foreign_key "payments", "offices"
  add_foreign_key "payments", "tenants"
  add_foreign_key "product_types", "tenants"
  add_foreign_key "products", "product_types"
  add_foreign_key "products", "tenants"
  add_foreign_key "rooms", "offices"
  add_foreign_key "rooms", "tenants"
  add_foreign_key "tenants", "tenants"
end
