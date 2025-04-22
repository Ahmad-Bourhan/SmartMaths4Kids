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
    @results = []

    @answers.each do |question_id, _|
      question = Question.find_by(id: question_id)
      next unless question

      user_answer = @answers[question_id].to_s.strip
      is_correct = question.correct_answer.strip.downcase == user_answer.downcase

      if is_correct
        @correct_questions << question
        @total_score += question.mark
      else
        @incorrect_questions << { question: question, user_answer: user_answer }
      end

      @results << {
        question_text: question.question_text,
        user_answer: user_answer,
        correct_answer: question.correct_answer,
        is_correct: is_correct
      }
    end

    session[:results] = @results
    redirect_to quiz_results_path(total_score: @total_score)
  end

  def results
    @total_score = params[:total_score]
    @results = session[:results] || []
  
    
    Rails.logger.info "🔍 RESULTS DEBUG:"
    Rails.logger.info @results.inspect
  end
  
end
