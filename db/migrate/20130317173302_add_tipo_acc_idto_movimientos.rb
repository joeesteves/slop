class AddTipoAccIdtoMovimientos < ActiveRecord::Migration
  def up
  	add_column :movimientos, :tipo_acc_id, :integer
  	add_index :movimientos, :tipo_acc_id
  end
		
  def down
  end
end
