class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.integer :rp
      t.boolean :activo
      t.string :nombre
      t.string :desc

      t.timestamps
    end
  end
end
