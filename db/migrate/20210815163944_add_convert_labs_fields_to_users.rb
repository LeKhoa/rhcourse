class AddConvertLabsFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cl_email, :string
    add_column :users, :cl_password, :string
    add_column :users, :cl_account_created, :boolean, default: false
  end
end
