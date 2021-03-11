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

ActiveRecord::Schema.define(version: 2020_01_05_042002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conocidos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "graduado_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["graduado_id"], name: "index_conocidos_on_graduado_id"
    t.index ["user_id", "graduado_id"], name: "index_conocidos_on_user_id_and_graduado_id", unique: true
    t.index ["user_id"], name: "index_conocidos_on_user_id"
  end

  create_table "elecciones", force: :cascade do |t|
    t.string "ano", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "empadronamientos", force: :cascade do |t|
    t.bigint "eleccion_id", null: false
    t.bigint "graduado_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["eleccion_id", "graduado_id"], name: "index_empadronamientos_on_eleccion_id_and_graduado_id", unique: true
    t.index ["eleccion_id"], name: "index_empadronamientos_on_eleccion_id"
    t.index ["graduado_id"], name: "index_empadronamientos_on_graduado_id"
  end

  create_table "graduados", force: :cascade do |t|
    t.string "documento", null: false
    t.string "nombre", null: false
    t.string "titulo", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["documento"], name: "index_graduados_on_documento", unique: true
    t.index ["user_id"], name: "index_graduados_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conocidos", "graduados"
  add_foreign_key "conocidos", "users"
  add_foreign_key "empadronamientos", "elecciones"
  add_foreign_key "empadronamientos", "graduados"
  add_foreign_key "graduados", "users"
end
