class CreateScores < ActiveRecord::Migration[7.2]
  def change
    create_table :scores do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :score
      t.datetime :attempted_at

      t.timestamps
    end
  end
end
