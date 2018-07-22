class AddCatfiscalEmpresa < ActiveRecord::Migration
  def change
  	add_column :empresas, :catfiscal_id, :integer
	end
end
