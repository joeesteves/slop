class AddFechaCierreCtas < ActiveRecord::Migration
 def change
  	add_column :cuentas, :cierre, :integer
  end
end
