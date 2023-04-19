class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.text :description, limit: 1000, null: true
      t.date :start_date, default: -> { 'CURRENT_TIMESTAMP' }
      t.date :end_date, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :status, limit: 20, default: 'pending'
      t.integer :agreed_amount, default: 0
      t.references :project, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.references :freelancer, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
