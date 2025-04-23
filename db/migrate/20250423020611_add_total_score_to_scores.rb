class AddTotalScoreToScores < ActiveRecord::Migration[7.2]
  def change
    add_column :scores, :total_score, :integer
  end
end
