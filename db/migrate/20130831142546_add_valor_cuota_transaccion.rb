class AddValorCuotaTransaccion < ActiveRecord::Migration
  def change
  	add_column :transacciones, :valorCuota, :decimal
  end
end
