class AddDeletedAtToAll < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
    add_column :project_masters, :deleted_at, :datetime
    add_index :project_masters, :deleted_at
    add_column :tasks, :deleted_at, :datetime
    add_index :tasks, :deleted_at
    add_column :members, :deleted_at, :datetime
    add_index :members, :deleted_at
    add_column :clients, :deleted_at, :datetime
    add_index :clients, :deleted_at
  end
end
