class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title, limit: 100
      t.text :description, limit: 1000
      t.string :location, limit: 100 # one of the following: [remote, on-site]
      t.string :type, limit: 20 # one of the following: [freelance, full-time, part-time]
      t.integer :budget
      t.integer :duration
      t.string :status, limit: 20
      t.date :deadline

      ### add user references as user_id
      t.references :user, foreign_key: true
      t.timestamps
    end

    add_index :projects, :title, unique: true
    add_index :projects, :user_id
  end
end
