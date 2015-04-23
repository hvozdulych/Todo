class RemoveUnnecessaryColumnFromList < ActiveRecord::Migration
  def change
    remove_column :lists, :todo_items_id, :integer
  end
end
