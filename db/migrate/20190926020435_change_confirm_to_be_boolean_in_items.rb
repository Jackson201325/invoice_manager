class ChangeConfirmToBeBooleanInItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :confirm, :boolean, using: 'confirm::boolean'
  end
end
