class AddempresatoCuentas < ActiveRecord::Migration
  def change
		  add_column :cuentas, :empresa_id, :integer
			add_index :cuentas, :empresa_id 
  end
end
