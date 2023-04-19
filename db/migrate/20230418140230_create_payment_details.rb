class CreatePaymentDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_details do |t|
      t.string :method, limit: 100
      t.string :account_number, limit: 100
      t.integer :amount, default: 0
      t.string :status, limit: 20, default: 'pending'
      t.date :date, default: -> { 'CURRENT_TIMESTAMP' }
      t.references :contract, null: false, foreign_key: true
      t.timestamps
    end
  end
end
