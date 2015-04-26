class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :name
      t.string :surname
      t.integer :age
      t.string :genre
    end
  end
end
