class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.references :task, null: false, foreign_key: true
      t.text :question
      t.text :answer
      t.boolean :status

      t.timestamps
    end
  end
end
