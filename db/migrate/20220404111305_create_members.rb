class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.bigint :user_id
      t.bigint :project_master_id

      t.timestamps
    end
  end
end
