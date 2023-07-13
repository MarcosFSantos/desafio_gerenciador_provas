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

ActiveRecord::Schema[7.0].define(version: 2023_07_13_191329) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "participante_provas", id: false, force: :cascade do |t|
    t.bigint "participante_id", null: false
    t.bigint "prova_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participante_id"], name: "index_participante_provas_on_participante_id"
    t.index ["prova_id"], name: "index_participante_provas_on_prova_id"
  end

  create_table "participantes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usuarios_id"
    t.index ["usuarios_id"], name: "index_participantes_on_usuarios_id"
  end

  create_table "provas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "titulo"
    t.integer "duracao"
  end

  create_table "questoes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "enunciado"
    t.integer "resposta_correta"
    t.bigint "prova_id"
    t.index ["prova_id"], name: "index_questoes_on_prova_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.string "email"
    t.string "matricula"
    t.string "password_digest"
    t.integer "perfil", default: 1
  end

  add_foreign_key "participante_provas", "participantes"
  add_foreign_key "participante_provas", "provas"
  add_foreign_key "participantes", "usuarios", column: "usuarios_id"
  add_foreign_key "questoes", "provas"
end
