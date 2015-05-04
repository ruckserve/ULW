class CreateFairMktRents < ActiveRecord::Migration
  def change
    create_table :fair_mkt_rents do |t|
      t.integer :fmr0,       null: false
      t.integer :fmr1,       null: false
      t.integer :fmr2,       null: false
      t.integer :fmr3,       null: false
      t.integer :fmr4,       null: false
      t.string  :metro_code, null: false
      t.integer :year,       null: false

      t.timestamps null: false
    end
    add_index :fair_mkt_rents, :metro_code
    add_index :fair_mkt_rents, :year
  end
end
