class AddPtypeToProjectMasters < ActiveRecord::Migration[7.0]
  def change
    add_column :project_masters, :ptype, :boolean
  end
end
