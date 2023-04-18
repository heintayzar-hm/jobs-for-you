class CreateUserExperienceTags < ActiveRecord::Migration[7.0]
  def change
    create_table :user_experience_tags do |t|
      t.string :name, limit: 20
      t.string :description, limit: 100
      t.timestamps


      ### user references as user_id

      t.references :user, foreign_key: true
    end

    add_index :user_experience_tags, [:name, :user_id], unique: true
    add_index :users, :id, unique: true
  end
end
