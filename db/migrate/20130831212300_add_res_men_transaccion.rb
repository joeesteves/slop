class AddResMenTransaccion < ActiveRecord::Migration
  def change
  	add_column :transacciones, :rmensuales, :boolean
  end
end
