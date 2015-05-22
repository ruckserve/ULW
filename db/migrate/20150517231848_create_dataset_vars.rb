class CreateDatasetVars < ActiveRecord::Migration
  def change
    create_table :dataset_vars do |t|
      t.string :filename,        null: false
      t.string :sheetname,       null: false
      t.string :fmr0,            null: false
      t.string :fmr1,            null: false
      t.string :fmr2,            null: false
      t.string :fmr3,            null: false
      t.string :fmr4,            null: false
      t.string :metro_code,      null: false
      t.string :area_name,       null: false
      t.string :state,           null: false
      t.string :metro_area,      null: false
      t.belongs_to :fmr_dataset, index: true

      t.timestamps null: false
    end
    add_foreign_key :dataset_vars, :fmr_datasets
  end
end
