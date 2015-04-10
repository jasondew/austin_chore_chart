class CreateCompletedChores < ActiveRecord::Migration
  def change
    create_table :completed_chores do |t|
      t.belongs_to :chore
      t.date :completed_on
      t.datetime :created_at, null: false
    end
  end
end
