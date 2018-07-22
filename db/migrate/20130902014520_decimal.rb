class Decimal < ActiveRecord::Migration
  def change
  	change_column :transacciones, :valorCuota, :decimal, :precision => 12, :scale => 2
  	change_column :transacciones, :importe, :decimal, :precision => 12, :scale => 2
  	change_column :asientos, :debe, :decimal, :precision => 12, :scale => 2
  	change_column :asientos, :haber, :decimal, :precision => 12, :scale => 2
  	change_column :cuotas, :importe, :decimal, :precision => 12, :scale => 2
  end
end
