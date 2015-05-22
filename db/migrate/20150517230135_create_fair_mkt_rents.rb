class CreateFairMktRents < ActiveRecord::Migration
  def change
    create_table :fair_mkt_rents do |t|
      t.string :fmr0,            null: false
      t.string :fmr1,            null: false
      t.string :fmr2,            null: false
      t.string :fmr3,            null: false
      t.string :fmr4,            null: false
      t.string :metro_code,      null: false
      t.string :year,            null: false
      t.belongs_to :fmr_dataset, index: true

      t.timestamps null: false
    end
    add_index :fair_mkt_rents, :metro_code
    add_index :fair_mkt_rents, :year
    add_foreign_key :fair_mkt_rents, :fmr_datasets
  end
end
