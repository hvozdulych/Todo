class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string     :title
      t.references :todo_items
      t.timestamps
    end
  end
end
