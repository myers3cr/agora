class AddAdditionalFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :org_id, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string
    add_column :users, :phone, :string
  end
end