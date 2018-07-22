class CreateMovorigens < ActiveRecord::Migration
  def change
    create_table :movorigens do |t|
      t.integer :cat_ori
      t.integer :est_ori
      t.integer :rod_ori
      t.references :movimiento

      t.timestamps
    end
    add_index :movorigens, :movimiento_id
  end
end
