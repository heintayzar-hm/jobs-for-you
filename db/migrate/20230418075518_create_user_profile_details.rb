class CreateUserProfileDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profile_details do |t|
      t.string :street
      t.string :country
      t.string :district
      t.integer :age
      t.integer :experience
      t.string :national_id
      t.string :passport_id

      t.timestamps
    end

    add_index :user_profile_details, :experience, unique: true
  end
end
