class AddCantidadToMovimientos < ActiveRecord::Migration
  def change
    add_column :movimientos, :cantidad, :integer
    add_column :movimientos, :kilos, :integer
  end
end
