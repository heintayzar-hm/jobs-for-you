class AddUserIdToProfileDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_profile_details, :user, null: false, foreign_key: true
  end
end
