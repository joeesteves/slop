class CreateCategoriasTipos < ActiveRecord::Migration
  def change
    create_table :categorias_tipos do |t|
      t.string :nombre
      t.string :desc

      t.timestamps
    end
  end
end
