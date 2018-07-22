class ChangeCatTipoTipoAccColumns < ActiveRecord::Migration
  def up
  	rename_column :cat_tipo_tipo_accs, :catTipo_id, :cat_tipo_id
  	rename_column :cat_tipo_tipo_accs, :tipoAcc_id, :tipo_acc_id

  	
  end

  def down
  end
end
