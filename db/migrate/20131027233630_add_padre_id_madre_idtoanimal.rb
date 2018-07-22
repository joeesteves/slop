class AddPadreIdMadreIdtoanimal < ActiveRecord::Migration
  def change
		add_column :animals, :padre_id, :integer
		add_column :animals, :madre_id, :integer
		add_column :animals, :alias, :string
		change_column :animals, :rp, :string

 	end
end
