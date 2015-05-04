class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :requested_by, null: false
      t.string :data_year,    null: false
      t.string :method,       null: false
      t.string :filename,     null: false
      t.string :description,  null: false

      t.timestamps null: false
    end

    change_table :fair_mkt_rents do |t|
      t.references :transactions
    end
  end
end
