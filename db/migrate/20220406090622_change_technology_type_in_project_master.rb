class ChangeTechnologyTypeInProjectMaster < ActiveRecord::Migration[7.0]
  def up
    change_column :project_masters, :technology, :string, array: true, default: [],using: "(string_to_array(technology, ','))"
  end

  def down
      change_column :project_masters, :technology, :string
    end
end
