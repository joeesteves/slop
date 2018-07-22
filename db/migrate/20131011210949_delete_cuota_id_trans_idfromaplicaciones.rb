class DeleteCuotaIdTransIdfromaplicaciones < ActiveRecord::Migration
  def change
  	remove_column :aplicaciones, :cuota_id
  	remove_column :aplicaciones, :transaccion_id
	end
end
