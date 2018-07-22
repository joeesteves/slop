class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :nombre
      t.string :desc
      t.references :categoriasTipo

      t.timestamps
    end
    add_index :categories, :categoriasTipo_id
  end
end
