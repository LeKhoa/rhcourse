class AddNameAndPhoneToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :budget_type, :integer
    add_column :users, :settings, :text
  end
end
