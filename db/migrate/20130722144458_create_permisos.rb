class CreatePermisos < ActiveRecord::Migration
  def change
    create_table :permisos do |t|
      t.references :establecimiento
      t.references :user
      t.integer :permiso

      t.timestamps
    end
  end
end
