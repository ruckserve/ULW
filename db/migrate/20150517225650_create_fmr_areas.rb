class CreateFmrAreas < ActiveRecord::Migration
  def change
    create_table :fmr_areas do |t|
      t.string :metro_code,      null: false
      t.string :state, limit: 2, null: false
      t.string :area_name,       null: false
      t.boolean :metro_area,     null: false
      t.string :year,            null: false
      t.belongs_to :fmr_dataset, index: true

      t.timestamps null: false
    end
    add_index :fmr_areas, :state
    add_index :fmr_areas, :year
    add_foreign_key :fmr_areas, :fmr_datasets
  end
end
