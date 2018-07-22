class AddAnimalIDtomediciones < ActiveRecord::Migration
  def change
		add_column :mediciones, :animal_id, :integer
	end
end
