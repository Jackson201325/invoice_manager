class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :total_spend
      t.integer :total_net_sales
      t.integer :total_profit
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
