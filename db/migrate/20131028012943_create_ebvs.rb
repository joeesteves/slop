class CreateEbvs < ActiveRecord::Migration
  def change
    create_table :ebvs do |t|
      t.date :fecha
      t.decimal :nacdird, :precision =>6, :scale => 2
      t.decimal :nacdirp, :precision =>6, :scale => 2
      t.decimal :nacmatd, :precision =>6, :scale => 2
      t.decimal :nacmatp, :precision =>6, :scale => 2
      t.decimal :dttdird, :precision =>6, :scale => 2
      t.decimal :dttdirp, :precision =>6, :scale => 2
      t.decimal :dttmatd, :precision =>6, :scale => 2
      t.decimal :dttmatp, :precision =>6, :scale => 2
      t.decimal :pasoad, :precision =>6, :scale => 2
      t.decimal :pesoap, :precision =>6, :scale => 2
      t.decimal :pesoaymd, :precision =>6, :scale => 2
      t.decimal :pesoaymp,:precision =>6, :scale => 2
      t.decimal :pesoadd, :precision =>6, :scale => 2
      t.decimal :pesoadp, :precision =>6, :scale => 2
      t.decimal :gdpd,:precision =>6, :scale => 2
      t.decimal :gdpp, :precision =>6, :scale => 2
      t.decimal :icad,:precision =>6, :scale => 2
      t.decimal :icap,:precision =>6, :scale => 2
      t.decimal :consumod, :precision =>6, :scale => 2
      t.decimal :consumop, :precision =>6, :scale => 2
      t.decimal :irfd, :precision =>6, :scale => 2
      t.decimal :irfp, :precision =>6, :scale => 2
      t.decimal :althd,:precision =>6, :scale => 2
      t.decimal :althp,:precision =>6, :scale => 2
      t.decimal :largod, :precision =>6, :scale => 2
      t.decimal :largop, :precision =>6, :scale => 2
      t.decimal :ctd, :precision =>6, :scale => 2
      t.decimal :ctp, :precision =>6, :scale => 2
      t.decimal :ced, :precision =>6, :scale => 2
      t.decimal :cep, :precision =>6, :scale => 2
      t.references :animal, index: true

      t.timestamps
    end
  end
end
