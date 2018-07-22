class CreateRodeos < ActiveRecord::Migration
  def change
    create_table :rodeos do |t|
      t.string :nombre
      t.string :desc

      t.timestamps
    end
  end
end
