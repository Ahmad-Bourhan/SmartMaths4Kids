class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.integer :usre_id
      t.string :firstName
      t.string :lastName
      t.integer :age

      t.timestamps
    end
  end
end
