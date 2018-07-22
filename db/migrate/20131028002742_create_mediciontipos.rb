class CreateMediciontipos < ActiveRecord::Migration
  def change
    create_table :mediciontipos do |t|
      t.integer :codigo
      t.string :nombre

      t.timestamps
    end
  end
end
