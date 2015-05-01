class AddRepeatToChores < ActiveRecord::Migration
  def change
    add_column :chores, :repeating, :boolean, default: false
  end
end
