class CreateMovimientos < ActiveRecord::Migration
  def change
    create_table :movimientos do |t|
      t.date :fecha
      t.string :desc
      t.references :animal
      t.references :estado
      t.references :rodeo
      t.references :category

      t.timestamps
    end
    add_index :movimientos, :animal_id
    add_index :movimientos, :estado_id
    add_index :movimientos, :rodeo_id
    add_index :movimientos, :category_id
  end
end
