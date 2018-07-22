class DeleteColTipo < ActiveRecord::Migration
  def up
      remove_column :transacciones, :tipo
  end

end
