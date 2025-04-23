class ChangeDetailsToJsonbInScores < ActiveRecord::Migration[7.0]
  def change
    change_column :scores, :details, :jsonb, using: 'details::jsonb'
  end
end
