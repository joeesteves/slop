class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nombre
      t.string :desc

      t.timestamps
    end
  end
end
