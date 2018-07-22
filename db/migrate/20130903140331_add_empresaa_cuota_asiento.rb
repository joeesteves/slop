class AddEmpresaaCuotaAsiento < ActiveRecord::Migration
  def change
  	add_column :cuotas, :empresa_id, :integer
		add_index :cuotas, :empresa_id 
	 	add_column :asientos, :empresa_id, :integer
		add_index :asientos, :empresa_id 


  end
end
