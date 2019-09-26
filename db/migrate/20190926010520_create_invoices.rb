class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.number :total_spend
      t.number :total_net_sales
      t.profit :total
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
