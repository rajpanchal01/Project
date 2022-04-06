class CreateTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :technologies do |t|
      t.string :tname
      t.string :ttype

      t.timestamps
    end
  end
end
