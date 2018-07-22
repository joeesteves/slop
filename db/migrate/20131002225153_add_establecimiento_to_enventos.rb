class AddEstablecimientoToEnventos < ActiveRecord::Migration
  def change
		add_column :eventos, :establecimiento_id, :integer
	end
end
