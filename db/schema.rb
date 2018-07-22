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

ActiveRecord::Schema.define(version: 20131107154418) do

  create_table "animals", force: true do |t|
    t.string   "rp"
    t.boolean  "activo"
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "padre_id"
    t.integer  "madre_id"
    t.string   "alias"
  end

  create_table "animals_movimientos", id: false, force: true do |t|
    t.integer "animal_id"
    t.integer "movimiento_id"
  end

  add_index "animals_movimientos", ["animal_id", "movimiento_id"], name: "index_animals_movimientos_on_animal_id_and_movimiento_id", using: :btree

  create_table "aplicaciones", force: true do |t|
    t.decimal  "importe",    precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cuota6"
    t.integer  "cuota9"
  end

  add_index "aplicaciones", ["cuota6"], name: "index_aplicaciones_on_cuota6", using: :btree
  add_index "aplicaciones", ["cuota9"], name: "index_aplicaciones_on_cuota9", using: :btree

  create_table "asientos", force: true do |t|
    t.date     "fecha"
    t.decimal  "debe",           precision: 12, scale: 2
    t.decimal  "haber",          precision: 12, scale: 2
    t.integer  "cuenta_id"
    t.integer  "transaccion_id"
    t.integer  "cuota_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "desc"
    t.integer  "empresa_id"
  end

  add_index "asientos", ["cuota_id"], name: "index_asientos_on_cuota_id", using: :btree
  add_index "asientos", ["empresa_id"], name: "index_asientos_on_empresa_id", using: :btree
  add_index "asientos", ["transaccion_id"], name: "index_asientos_on_transaccion_id", using: :btree

  create_table "cat_tipos", force: true do |t|
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cat_tipos_estados", id: false, force: true do |t|
    t.integer "cat_tipo_id"
    t.integer "estado_id"
  end

  add_index "cat_tipos_estados", ["cat_tipo_id", "estado_id"], name: "index_cat_tipos_estados_on_cat_tipo_id_and_estado_id", using: :btree
  add_index "cat_tipos_estados", ["estado_id", "cat_tipo_id"], name: "index_cat_tipos_estados_on_estado_id_and_cat_tipo_id", using: :btree

  create_table "cat_tipos_tipo_accs", id: false, force: true do |t|
    t.integer "cat_tipo_id"
    t.integer "tipo_acc_id"
  end

  add_index "cat_tipos_tipo_accs", ["cat_tipo_id", "tipo_acc_id"], name: "index_catTipo_tipoAcc_on_catTipo_id_and_tipoAcc_id", using: :btree
  add_index "cat_tipos_tipo_accs", ["tipo_acc_id", "cat_tipo_id"], name: "index_catTipo_tipoAcc_on_tipoAcc_id_and_catTipo_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "nombre"
    t.string   "desc"
    t.integer  "catTipo_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "pesoEstandard"
    t.boolean  "trazabilidad"
  end

  add_index "categories", ["catTipo_id"], name: "index_categories_on_categoriasTipo_id", using: :btree

  create_table "catfiscales", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.boolean  "iva"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cotizaciones", force: true do |t|
    t.date     "fecha"
    t.decimal  "cotizacion", precision: 12, scale: 4
    t.integer  "moneda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cotizaciones", ["moneda_id"], name: "index_cotizaciones_on_moneda_id", using: :btree

  create_table "cuentas", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "empresa_id"
  end

  add_index "cuentas", ["empresa_id"], name: "index_cuentas_on_empresa_id", using: :btree

  create_table "cuotas", force: true do |t|
    t.date     "fecha"
    t.integer  "cuota"
    t.decimal  "importe",        precision: 12, scale: 2
    t.integer  "transaccion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "desc"
    t.integer  "empresa_id"
    t.integer  "tipo"
  end

  add_index "cuotas", ["empresa_id"], name: "index_cuotas_on_empresa_id", using: :btree
  add_index "cuotas", ["tipo"], name: "index_cuotas_on_tipo", using: :btree
  add_index "cuotas", ["transaccion_id"], name: "index_cuotas_on_transaccion_id", using: :btree

  create_table "ebvs", force: true do |t|
    t.date     "fecha"
    t.decimal  "nacdird",    precision: 6, scale: 2
    t.decimal  "nacdirp",    precision: 6, scale: 2
    t.decimal  "nacmatd",    precision: 6, scale: 2
    t.decimal  "nacmatp",    precision: 6, scale: 2
    t.decimal  "dttdird",    precision: 6, scale: 2
    t.decimal  "dttdirp",    precision: 6, scale: 2
    t.decimal  "dttmatd",    precision: 6, scale: 2
    t.decimal  "dttmatp",    precision: 6, scale: 2
    t.decimal  "pasoad",     precision: 6, scale: 2
    t.decimal  "pesoap",     precision: 6, scale: 2
    t.decimal  "pesoaymd",   precision: 6, scale: 2
    t.decimal  "pesoaymp",   precision: 6, scale: 2
    t.decimal  "pesoadd",    precision: 6, scale: 2
    t.decimal  "pesoadp",    precision: 6, scale: 2
    t.decimal  "gdpd",       precision: 6, scale: 2
    t.decimal  "gdpp",       precision: 6, scale: 2
    t.decimal  "icad",       precision: 6, scale: 2
    t.decimal  "icap",       precision: 6, scale: 2
    t.decimal  "consumod",   precision: 6, scale: 2
    t.decimal  "consumop",   precision: 6, scale: 2
    t.decimal  "irfd",       precision: 6, scale: 2
    t.decimal  "irfp",       precision: 6, scale: 2
    t.decimal  "althd",      precision: 6, scale: 2
    t.decimal  "althp",      precision: 6, scale: 2
    t.decimal  "largod",     precision: 6, scale: 2
    t.decimal  "largop",     precision: 6, scale: 2
    t.decimal  "ctd",        precision: 6, scale: 2
    t.decimal  "ctp",        precision: 6, scale: 2
    t.decimal  "ced",        precision: 6, scale: 2
    t.decimal  "cep",        precision: 6, scale: 2
    t.integer  "animal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ebvs", ["animal_id"], name: "index_ebvs_on_animal_id", using: :btree

  create_table "empresas", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "catfiscal_id"
    t.integer  "ctaivacompras"
    t.integer  "ctaivaventas"
  end

  create_table "establecimientos", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "clima"
  end

  create_table "estado_accions", force: true do |t|
    t.integer  "estado_id"
    t.integer  "tipo_acc_id"
    t.integer  "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "estado_accions", ["estado_id"], name: "index_estado_accions_on_estado_id", using: :btree
  add_index "estado_accions", ["tipo_acc_id"], name: "index_estado_accions_on_tipo_acc_id", using: :btree

  create_table "estados", force: true do |t|
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: true do |t|
    t.date     "fecha"
    t.decimal  "registro",           precision: 7, scale: 2
    t.text     "desc"
    t.integer  "eventotipo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "establecimiento_id"
  end

  add_index "eventos", ["eventotipo_id"], name: "index_eventos_on_eventotipo_id", using: :btree

  create_table "eventotipos", force: true do |t|
    t.integer  "codigo"
    t.string   "nombre"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unidad"
  end

  create_table "mediciones", force: true do |t|
    t.date     "fecha"
    t.decimal  "peso",            precision: 6, scale: 2
    t.decimal  "adpv",            precision: 6, scale: 2
    t.decimal  "adpvna",          precision: 6, scale: 2
    t.decimal  "ce",              precision: 6, scale: 2
    t.integer  "mediciontipo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "animal_id"
  end

  add_index "mediciones", ["mediciontipo_id"], name: "index_mediciones_on_mediciontipo_id", using: :btree

  create_table "mediciontipos", force: true do |t|
    t.integer  "codigo"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monedas", force: true do |t|
    t.integer  "codigo"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movimientos", force: true do |t|
    t.date     "fecha"
    t.string   "desc"
    t.integer  "estado_id"
    t.integer  "rodeo_id"
    t.integer  "category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.integer  "cantidad"
    t.integer  "kilos"
    t.integer  "tipo_acc_id"
    t.integer  "origen_id"
    t.integer  "establecimiento_id"
    t.integer  "empresa_id"
  end

  add_index "movimientos", ["category_id"], name: "index_movimientos_on_category_id", using: :btree
  add_index "movimientos", ["empresa_id"], name: "index_movimientos_on_empresa_id", using: :btree
  add_index "movimientos", ["establecimiento_id"], name: "index_movimientos_on_establecimiento_id", using: :btree
  add_index "movimientos", ["estado_id"], name: "index_movimientos_on_estado_id", using: :btree
  add_index "movimientos", ["origen_id"], name: "index_movimientos_on_origen_id", using: :btree
  add_index "movimientos", ["rodeo_id"], name: "index_movimientos_on_rodeo_id", using: :btree
  add_index "movimientos", ["tipo_acc_id"], name: "index_movimientos_on_tipo_acc_id", using: :btree
  add_index "movimientos", ["user_id"], name: "index_movimientos_on_user_id", using: :btree

  create_table "movorigens", force: true do |t|
    t.integer  "cat_ori"
    t.integer  "est_ori"
    t.integer  "rod_ori"
    t.integer  "movimiento_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "movorigens", ["movimiento_id"], name: "index_movorigens_on_movimiento_id", using: :btree

  create_table "permisos", force: true do |t|
    t.integer  "establecimiento_id"
    t.integer  "user_id"
    t.integer  "permiso"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "empresa_id"
  end

  add_index "permisos", ["empresa_id"], name: "index_permisos_on_empresa_id", using: :btree

  create_table "rodeos", force: true do |t|
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tareas", force: true do |t|
    t.date     "fecha"
    t.string   "titulo"
    t.text     "desc"
    t.integer  "estado"
    t.integer  "establecimiento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tareas", ["establecimiento_id"], name: "index_tareas_on_establecimiento_id", using: :btree

  create_table "tipo_accs", force: true do |t|
    t.string   "nombre"
    t.integer  "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transacciones", force: true do |t|
    t.date     "fecha"
    t.decimal  "importe",            precision: 12, scale: 2
    t.integer  "cuotascantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ctaD_id"
    t.integer  "ctaH_id"
    t.integer  "transacciontipo_id"
    t.integer  "empresa_id"
    t.text     "desc"
    t.decimal  "valorCuota",         precision: 12, scale: 2
    t.boolean  "rmensuales"
    t.boolean  "civa"
    t.decimal  "bruto",              precision: 12, scale: 2
    t.decimal  "iva",                precision: 12, scale: 2
  end

  add_index "transacciones", ["ctaD_id"], name: "index_transacciones_on_ctaD_id", using: :btree
  add_index "transacciones", ["ctaH_id"], name: "index_transacciones_on_ctaH_id", using: :btree
  add_index "transacciones", ["empresa_id"], name: "index_transacciones_on_empresa_id", using: :btree
  add_index "transacciones", ["transacciontipo_id"], name: "index_transacciones_on_transacciontipo_id", using: :btree

  create_table "transacciontipos", force: true do |t|
    t.integer  "codigo"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "usuario"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "ult_emp"
    t.integer  "ult_est"
  end

end
