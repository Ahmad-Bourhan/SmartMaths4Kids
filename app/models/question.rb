class Question < ApplicationRecord
    validates :mark, presence: true, inclusion: { in: 1..5, message: "The mark must be between 1 and 5" }
    validates :question_text, presence: true
    validates :difficulty_level, inclusion: { in: [ 1, 2, 3 ], message: "Difficulty level must be 1 (easy), 2 (medium), or 3 (hard)" }
end
