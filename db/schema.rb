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

ActiveRecord::Schema.define(version: 2020_01_02_042157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "elecciones", force: :cascade do |t|
    t.string "ano", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "empadronamientos", force: :cascade do |t|
    t.bigint "eleccion_id", null: false
    t.bigint "votante_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["eleccion_id"], name: "index_empadronamientos_on_eleccion_id"
    t.index ["votante_id"], name: "index_empadronamientos_on_votante_id"
  end

  create_table "votantes", force: :cascade do |t|
    t.string "documento", null: false
    t.string "nombre", null: false
    t.string "titulo", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["documento"], name: "index_votantes_on_documento", unique: true
  end

  add_foreign_key "empadronamientos", "elecciones"
  add_foreign_key "empadronamientos", "votantes"
end
