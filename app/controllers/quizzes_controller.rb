class QuizzesController < ApplicationController
  before_action :authenticate_user!
  def index
    @levels = Question.pluck(:difficulty_level).uniq
  end

  def show_questions
    @level = params[:level]
    @questions = Question.where(difficulty_level: @level)
  end
  def start
    @level = params[:level]
    @questions = Question.where(difficulty_level: @level)
    redirect_to quiz_questions_path(level: @level)
  end
  
  def submit_all
    @answers = params[:answers] || {}
    @correct_questions = []
    @incorrect_questions = []
    @total_score = 0
  
    # Loop through all answers submitted by the user
    @answers.each do |question_id, user_answer|
      question = Question.find_by(id: question_id)
      next unless question # Skip if question not found
  
      # Compare user answer with the correct answer (case insensitive)
      if question.correct_answer.strip.downcase == user_answer.strip.downcase
        @correct_questions << question # Add to correct questions
        @total_score += question.mark # Add marks to total score
      else
        @incorrect_questions << { question: question, user_answer: user_answer } # Add to incorrect questions
      end
    end
  
    # Redirect to the quiz results page and pass the total score as a parameter
    redirect_to quiz_results_path(total_score: @total_score)
  end
  def results
    @total_score = params[:total_score] # Retrieve total score passed via redirect
  end
    
end
