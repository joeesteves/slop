class AddTransaccionTipoIDtoTransacciones < ActiveRecord::Migration
  def change
			add_column :transacciones, :transacciontipo_id, :integer
			add_index :transacciones, :transacciontipo_id 
  end
end
