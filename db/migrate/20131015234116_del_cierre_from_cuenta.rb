class DelCierreFromCuenta < ActiveRecord::Migration
  def change
  	remove_column :cuentas, :cierre
	end
end
