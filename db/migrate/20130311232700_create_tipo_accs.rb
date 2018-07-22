class CreateTipoAccs < ActiveRecord::Migration
  def change
    create_table :tipo_accs do |t|
      t.string :nombre
      t.integer :codigo

      t.timestamps
    end
  end
end
