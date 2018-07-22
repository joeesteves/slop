class AddMovOrigenToMovimientos < ActiveRecord::Migration
  def change
    add_column :movimientos, :origen_id, :integer
    add_index :movimientos, :origen_id
  end
end
