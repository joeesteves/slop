class Deldecimalfromeventos < ActiveRecord::Migration
  def change
  	remove_column :eventos, :decimal
	end
end
