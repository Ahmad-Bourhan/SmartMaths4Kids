class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.integer :difficulty_level
      t.string :correct_answer
      t.integer :mark

      t.timestamps
    end
  end
end
