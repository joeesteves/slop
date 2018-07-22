class AddUserToMovimientos < ActiveRecord::Migration
  def change
    add_column :movimientos, :user_id, :integer
    add_index :movimientos, :user_id
  end
end
