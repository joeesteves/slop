class Delunidadfromeventos < ActiveRecord::Migration
  def change
      remove_column :eventos, :unidad
			add_column :eventotipos, :unidad, :string
	end
end
