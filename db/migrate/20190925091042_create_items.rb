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
      t.string :cost_price
      t.string :sales_price
      t.integer :order
      t.integer :total_revenue
      t.integer :total_cost
      t.integer :profit
      t.integer :confirm
      t.references :invoice
      t.timestamps
    end
  end
end
