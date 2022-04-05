class AddColumnsToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :due_date, :datetime
    add_column :tasks, :completed_date, :datetime
  end
end
