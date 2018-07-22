class CreateCuentas < ActiveRecord::Migration
  def change
    create_table :cuentas do |t|
      t.string :codigo
      t.string :nombre
      t.integer :tipo

      t.timestamps
    end
  end
end
