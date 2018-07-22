class AddClimaEstablecimiento < ActiveRecord::Migration
  def change
  	add_column :establecimientos, :clima, :text
  end
end
