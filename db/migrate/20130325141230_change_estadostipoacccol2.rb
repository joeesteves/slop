class ChangeEstadostipoacccol2 < ActiveRecord::Migration
  def up
	  rename_column :estados_tipo_accs, :estados_id, :estado_id
  end

  def down
  end
end
