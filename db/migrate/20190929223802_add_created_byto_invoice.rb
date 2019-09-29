class AddCreatedBytoInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :created_by, :string
  end
end
