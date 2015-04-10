class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :name
      t.integer :rate
      t.text :notes
      t.timestamps null: false
    end
  end
end
