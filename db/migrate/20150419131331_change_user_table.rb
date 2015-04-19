class ChangeUserTable < ActiveRecord::Migration
  def change
    remove_column :users, :encrypted_password, :string
    remove_column :users, :salt, :string

    add_column :users, :password, :string
  end
end
