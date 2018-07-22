class CreateTareas < ActiveRecord::Migration
  def change
    create_table :tareas do |t|
      t.date :fecha
      t.string :titulo
      t.text :desc
      t.integer :estado
      t.references :establecimiento, index: true

      t.timestamps
    end
  end
end
