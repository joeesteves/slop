class CreateEventotipos < ActiveRecord::Migration
  def change
    create_table :eventotipos do |t|
      t.integer :codigo
      t.string :nombre
      t.text :desc

      t.timestamps
    end
  end
end
