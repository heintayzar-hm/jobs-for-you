class AddContractToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :contract, null: false, foreign_key: true
  end
end
