class CreateFairMktRents < ActiveRecord::Migration
  def change
    create_table :fair_mkt_rents do |t|
      t.integer :fmr0
      t.integer :fmr1
      t.integer :fmr2
      t.integer :fmr3
      t.integer :fmr4
      t.string :metro_code
      t.integer :year

      t.timestamps null: false
    end
    add_index :fair_mkt_rents, :metro_code
    add_index :fair_mkt_rents, :year
  end
end
