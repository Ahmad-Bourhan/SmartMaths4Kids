json.extract! question, :id, :question_text, :difficulty_level, :correct_answer, :mark, :created_at, :updated_at
json.url question_url(question, format: :json)
