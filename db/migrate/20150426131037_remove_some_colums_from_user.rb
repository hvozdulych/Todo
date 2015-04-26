class RemoveSomeColumsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :surname, :string
    remove_column :users, :age, :integer
    remove_column :users, :genre, :string

    add_column :users, :login, :string
  end
end
