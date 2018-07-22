class DropEstablecimientosUsers < ActiveRecord::Migration
  def change
		drop_table :establecimientos_users 
	end

end
