class CreateAplicaciones < ActiveRecord::Migration
  def change
    create_table :aplicaciones do |t|
      t.references :cuota, index: true
      t.references :transaccion, index: true
      t.decimal :importe, :precision => 12, :scale => 2

      t.timestamps
    end
  end
end
