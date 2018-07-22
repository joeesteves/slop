class CreateEstadoAccions < ActiveRecord::Migration
  def change
    create_table :estado_accions do |t|
      t.references :estado
      t.references :tipo_acc
      t.integer :codigo

      t.timestamps
    end
    add_index :estado_accions, :estado_id
    add_index :estado_accions, :tipo_acc_id
  end
end
