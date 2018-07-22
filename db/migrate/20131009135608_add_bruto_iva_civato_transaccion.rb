class AddBrutoIvaCivatoTransaccion < ActiveRecord::Migration
  def change
		add_column :transacciones, :civa, :boolean
		add_column :transacciones, :bruto, :decimal, :precision => 12, :scale => 2
		add_column :transacciones, :iva, :decimal, :precision => 12, :scale => 2
  end
end
