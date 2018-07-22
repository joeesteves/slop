class ChangeEstadostipoacccol < ActiveRecord::Migration
  def up
  	rename_column :estados_tipo_accs, :tipo_accs_id, :tipo_acc_id
  end

  def down
  end
end
