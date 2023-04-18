class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :text
      t.integer :rating, default: 0, :tinyint

      ### revewer references as reviewer_id
      t.references :reviewer, foreign_key: { to_table: :users }

      ### reviewee references as reviewee_id
      t.references :reviewee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
