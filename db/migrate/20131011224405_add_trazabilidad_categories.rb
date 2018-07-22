class AddTrazabilidadCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :trazabilidad, :boolean
	end
end
