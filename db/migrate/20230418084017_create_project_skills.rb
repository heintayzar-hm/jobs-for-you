class CreateProjectSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :project_skills do |t|
      t.string :name, limit: 20
      t.string :description, limit: 100
      t.timestamps
    end
  end
end
