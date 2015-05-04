class CreateFmrAreas < ActiveRecord::Migration
  def change
    create_table :fmr_areas do |t|
      t.string  :metro_code, null: false
      t.string  :state,      null: false, limit: 2
      t.string  :area_name,  null: false
      t.boolean :metro_area, null: false
      t.integer :year,       null: false

      t.timestamps null: false
      t.references :transactions
    end
    add_index :fmr_areas, :state
    add_index :fmr_areas, :year
  end
end
