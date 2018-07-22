class AddCtasIvaEmpresa < ActiveRecord::Migration
  def change
 		add_column :empresas, :ctaivacompras, :integer
		add_column :empresas, :ctaivaventas, :integer
 	end
end
