class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :model
      t.text :description
      t.text :color
      t.string :company
      t.string :year
      t.string :url
      t.string :cost_price_usd
      t.string :cost_price_pyg
      t.string :sales_price_pyg
      t.string :profit_per_unit
      t.number :order
      t.number :total_revenue
      t.number :profit
      t.boolean :confirm
      t.number :total_cost_price_pyg

      t.timestamps
    end
  end
end
