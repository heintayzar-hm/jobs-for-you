class CreateProjectTags < ActiveRecord::Migration[7.0]
  def change
    create_table :project_tags do |t|
      t.references :project, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
