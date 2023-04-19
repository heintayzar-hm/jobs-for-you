class AddRecievedReviewsCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :recieved_reviews_count, :integer
  end
end
