class AddColumnCtaDCtaH < ActiveRecord::Migration
     def change
			add_column :transacciones, :ctaD_id, :integer
			add_index :transacciones, :ctaD_id 
			add_column :transacciones, :ctaH_id, :integer
			add_index :transacciones, :ctaH_id 

	end
end
