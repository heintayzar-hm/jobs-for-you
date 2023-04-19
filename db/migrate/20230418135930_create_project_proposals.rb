class CreateProjectProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :project_proposals do |t|
      t.text :description, limit: 1000, null: true
      t.integer :bid_amount, default: 0
      t.string :status, limit: 20, default: 'pending'
      t.references :project, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.references :freelancer, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
