class AddPesoStandardCategoria < ActiveRecord::Migration
  def change
  	add_column :categories, :pesoEstandard, :integer
  end
end
