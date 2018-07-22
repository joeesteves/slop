class ChangeColumn < ActiveRecord::Migration
 def up
  	rename_column :transacciones, :cuotas, :cuotascantidad
 end

end
