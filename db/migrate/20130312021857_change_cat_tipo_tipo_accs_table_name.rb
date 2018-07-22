class ChangeCatTipoTipoAccsTableName < ActiveRecord::Migration
  def up
  	  	rename_table :catTipo_tipoAcc, 	:cat_tipo_tipo_accs
  end

  def down
  end
end
