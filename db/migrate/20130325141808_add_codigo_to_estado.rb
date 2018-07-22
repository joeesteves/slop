class AddCodigoToEstado < ActiveRecord::Migration
  def change
    add_column :estados, :codigo, :string
  end
end
