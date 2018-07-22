class CreateTransacciones < ActiveRecord::Migration
  def change
    create_table :transacciones do |t|
      t.date :fecha
      t.integer :tipo
      t.decimal :importe
      t.integer :cuotas

      t.timestamps
    end
  end
end
