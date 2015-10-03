class CollapsePaymentsIntoCompletedChores < ActiveRecord::Migration
  def up
    add_column :completed_chores, :paid_on, :date

    Payment.all.each do |payment|
      week_start = Date.commercial(payment.year, payment.week)
      week_end = week_start.end_of_week
      CompletedChore.where(child_id: payment.child_id)
                    .where("completed_on BETWEEN ? AND ?", week_start, week_end)
                    .update_all paid_on: payment.created_at.to_date
    end
  end

  def down
    remove_column :completed_chores, :paid_on
  end
end
