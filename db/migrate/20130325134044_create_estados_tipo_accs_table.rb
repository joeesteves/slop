class CreateEstadosTipoAccsTable < ActiveRecord::Migration
  def up
   create_table :estados_tipo_accs, :id => false do |t|
        t.references :estados
        t.references :tipo_accs
    end
    add_index :estados_tipo_accs, [:estados_id, :tipo_accs_id]
    add_index :estados_tipo_accs, [:tipo_accs_id, :estados_id]

  end

  def down
  		    drop_table :estados_tipo_accs
  end
end
