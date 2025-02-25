class RenameUsreIdToUserId < ActiveRecord::Migration[7.2]
  def change
    rename_column :profiles, :usre_id, :user_id
  end
end
