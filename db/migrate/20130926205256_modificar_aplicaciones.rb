class ModificarAplicaciones < ActiveRecord::Migration
  def change
  	 add_column :aplicaciones, :cuota6, :integer
     add_index :aplicaciones, :cuota6 
		 add_column :aplicaciones, :cuota9, :integer
     add_index :aplicaciones, :cuota9 

  end
end
