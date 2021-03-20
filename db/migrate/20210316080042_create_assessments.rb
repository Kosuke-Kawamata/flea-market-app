class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.integer :user_rank, null: false
      t.text :message
      t.integer :trading_partner_id
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
