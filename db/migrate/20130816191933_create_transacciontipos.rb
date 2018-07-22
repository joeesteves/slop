class CreateTransacciontipos < ActiveRecord::Migration
  def change
    create_table :transacciontipos do |t|
      t.integer :codigo
      t.string :nombre

      t.timestamps
    end
  end
end
