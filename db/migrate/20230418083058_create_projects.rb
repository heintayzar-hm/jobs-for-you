class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title, limit: 100
      t.text :description, limit: 1000
      t.string :location, limit: 100 # one of the following: [remote, on-site]
      t.string :project_type, limit: 20 # one of the following: [freelance, full-time, part-time]
      t.integer :budget
      t.integer :duration
      t.string :status, limit: 20, default: 'pending' # one of the following: [pending, in-progress, completed, cancelled]
      t.date :deadline

      ### add user references as user_id
      t.references :client, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
