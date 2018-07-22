class ChangeTransacCuotaAsiento < ActiveRecord::Migration
  def change
  	change_column :transacciones, :valorCuota, :decimal, :precision => 8, :scale => 4
  	change_column :transacciones, :importe, :decimal, :precision => 8, :scale => 4
  	change_column :asientos, :debe, :decimal, :precision => 8, :scale => 4
  	change_column :asientos, :haber, :decimal, :precision => 8, :scale => 4
  	change_column :cuotas, :importe, :decimal, :precision => 8, :scale => 4

  end
end
