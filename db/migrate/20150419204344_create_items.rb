class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :todo
      t.references :list, index: true
    end
    add_foreign_key :items, :lists
  end
end
