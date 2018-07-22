class CatTipoJoin < ActiveRecord::Migration
  def up
    create_table :catTipo_tipoAcc, :id => false do |t|
        t.references :catTipo
        t.references :tipoAcc
    end
    add_index :catTipo_tipoAcc, [:catTipo_id, :tipoAcc_id]
    add_index :catTipo_tipoAcc, [:tipoAcc_id, :catTipo_id]
  end

  def down
		    drop_table :catTipo_tipoAcc

  end
end
