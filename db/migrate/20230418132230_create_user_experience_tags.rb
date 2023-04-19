class CreateUserExperienceTags < ActiveRecord::Migration[7.0]
  def change
    create_table :user_experience_tags do |t|
      t.references :user, foreign_key: true
      t.references :experience_tag, foreign_key: { to_table: :skills}
      t.timestamps
    end
  end
end
