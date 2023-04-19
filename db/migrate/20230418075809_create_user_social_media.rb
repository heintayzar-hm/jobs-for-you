class CreateUserSocialMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :user_social_media do |t|
      t.string :media_type, limit: 20
      t.string :url, limit: 100
      t.timestamps

      ### user references as user_id
      t.references :user, foreign_key: true
    end
  end
end
