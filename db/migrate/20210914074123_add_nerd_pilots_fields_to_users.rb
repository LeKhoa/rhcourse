class AddNerdPilotsFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :np_account_created, :boolean, default: false
  end
end
