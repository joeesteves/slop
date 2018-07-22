class RemoveAnimalIdColumn < ActiveRecord::Migration
  def up
  	    remove_column :movimientos, :animal_id
  end

  def down
  end
end
