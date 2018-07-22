class RenameCategoriaTipoToCatTipo < ActiveRecord::Migration
  def up
  	rename_table :categorias_tipos, :cat_tipos
	 	     
  end

  def down
  end
end
