class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.integer :usre_id
      t.string :first_name
      t.string :last_name
      t.integer :age

      t.timestamps
    end
  end
end
