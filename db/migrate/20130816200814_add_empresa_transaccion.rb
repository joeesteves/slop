class AddEmpresaTransaccion < ActiveRecord::Migration
  def change
			add_column :transacciones, :empresa_id, :integer
			add_index :transacciones, :empresa_id 
	end
end
