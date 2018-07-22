class CreateCatfiscales < ActiveRecord::Migration
  def change
    create_table :catfiscales do |t|
      t.string :codigo
      t.string :nombre
      t.boolean :iva

      t.timestamps
    end
  end
end
