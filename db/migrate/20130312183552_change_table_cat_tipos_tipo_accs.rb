class ChangeTableCatTiposTipoAccs < ActiveRecord::Migration
  def up
			rename_table :cat_tipo_tipo_accs, :cat_tipos_tipo_accs
  end

  def down
  end
end
