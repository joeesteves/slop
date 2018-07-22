class RemoveCodigoFromEstados < ActiveRecord::Migration
  def up
  	    remove_column :estados, :codigo
  end

  def down
  end
end
