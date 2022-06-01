class CreateJoinTableForUsersTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :technologies
  end
end
