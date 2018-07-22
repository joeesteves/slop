class CreateanimalsMovimientosTable < ActiveRecord::Migration
  def up
    create_table :animals_movimientos, :id => false do |t|
        t.references :animal
        t.references :movimiento
    end
    
    add_index :animals_movimientos, [:animal_id, :movimiento_id]
   
  end	

  def down
		    drop_table :animals_movimientos

  end
end
