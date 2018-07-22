class DropestadosTipoAccs < ActiveRecord::Migration
  def up
			drop_table :estados_tipo_accs
  end

  def down
  end
end
