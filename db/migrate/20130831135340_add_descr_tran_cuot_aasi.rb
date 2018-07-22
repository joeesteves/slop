class AddDescrTranCuotAasi < ActiveRecord::Migration
 def change
			add_column :transacciones, :desc, :text
			add_column :cuotas, :desc, :text
			add_column :asientos, :desc, :text
  end
end
