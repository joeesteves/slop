class DropCategoriasTiposAccsTable < ActiveRecord::Migration
  def up
  	drop_table :categorias_tipos_accs
  end

  def down
  end
end
