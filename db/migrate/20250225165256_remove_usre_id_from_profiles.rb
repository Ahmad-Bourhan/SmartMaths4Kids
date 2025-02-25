class RemoveUsreIdFromProfiles < ActiveRecord::Migration[7.2]
  def change
    remove_column :profiles, :usre_id, :integer
  end
end
