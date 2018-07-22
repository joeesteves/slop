class RanameCategoriasColumn < ActiveRecord::Migration
  def up
  	rename_column :categories, :categoriasTipo_id, :catTipo_id
  end

  def down
  end
end
