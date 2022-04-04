class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :project_masters, :Budget, :budget
  end
end
