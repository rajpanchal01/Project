class AddNewfieldsToProjectMaster < ActiveRecord::Migration[7.0]
  def change
    add_column :project_masters, :client_id, :integer
    add_column :project_masters, :client_requirements, :text
    add_column :project_masters, :Budget, :string
    add_column :project_masters, :start_date, :datetime
    add_column :project_masters, :end_date, :datetime
    add_column :project_masters, :expected_duration, :datetime
    add_column :project_masters, :phase, :string
    add_column :project_masters, :technology, :text
    change_column :project_masters, :ptype, :string
  end
end
