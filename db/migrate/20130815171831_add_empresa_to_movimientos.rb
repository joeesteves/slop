class AddEmpresaToMovimientos < ActiveRecord::Migration
  def change
			add_column :movimientos, :empresa_id, :integer
			add_index :movimientos, :empresa_id 
	end

end
