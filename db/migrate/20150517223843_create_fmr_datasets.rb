class CreateFmrDatasets < ActiveRecord::Migration
  def change
    create_table :fmr_datasets do |t|
      t.string :requested_by,  null: false
      t.string :data_year,     null: false
      t.string :method,        null: false
      t.string :description,   null: false

      t.timestamps null: false
    end
  end
end
