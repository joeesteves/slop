class CreateMediciones < ActiveRecord::Migration
  def change
    create_table :mediciones do |t|
      t.date :fecha
      t.decimal :peso, :precision => 6, :scale => 2
      t.decimal :adpv, :precision => 6, :scale => 2
      t.decimal :adpvna, :precision => 6, :scale => 2
      t.decimal :ce, :precision => 6, :scale => 2
      t.references :mediciontipo, index: true

      t.timestamps
    end
  end
end
