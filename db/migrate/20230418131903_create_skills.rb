class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name, limit: 100
      t.text :description, limit: 1000
      t.timestamps
    end
  end
end
