class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.date :fecha
			t.decimal :registro, :precision => 7, :scale => 2
      t.string :unidad
      t.text :desc
      t.references :eventotipo, index: true

      t.timestamps
    end
  end
end
