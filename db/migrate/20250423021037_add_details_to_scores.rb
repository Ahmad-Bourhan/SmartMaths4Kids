class AddDetailsToScores < ActiveRecord::Migration[7.2]
  def change
    add_column :scores, :details, :json
  end
end
