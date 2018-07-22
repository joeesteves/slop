class AddEmpresaIdPermisos < ActiveRecord::Migration
    def change
			add_column :permisos, :empresa_id, :integer
			add_index :permisos, :empresa_id 
	end
end
