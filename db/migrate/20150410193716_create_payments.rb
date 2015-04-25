class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :child
      t.integer :week, :year
      t.integer :amount

      t.timestamps null: false
    end
  end
end
