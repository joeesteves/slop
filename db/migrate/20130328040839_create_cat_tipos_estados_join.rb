class CreateCatTiposEstadosJoin < ActiveRecord::Migration
  def up
 	 create_table :cat_tipos_estados, :id => false do |t|
   	t.references :cat_tipo
   	t.references :estado
   end
   add_index :cat_tipos_estados, [:cat_tipo_id, :estado_id]
   add_index :cat_tipos_estados, [:estado_id, :cat_tipo_id]
  end

  def down
  end
end
