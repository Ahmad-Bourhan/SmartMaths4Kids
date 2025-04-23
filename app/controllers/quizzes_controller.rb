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
        @total_score += question.mark.to_i
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
    Score.create!(
      user: current_user,
      score: @total_score,
      attempted_at: Time.current,
      details: @results
    )

    redirect_to quiz_results_path(total_score: @total_score)
  end

  def results
    @total_score = params[:total_score].to_i
    @results = session[:results] || []
    @total_possible_score = @results.sum do |r|
      Question.find_by(question_text: r["question_text"])&.mark.to_i
    end
  
    Rails.logger.info "🔍 RESULTS DEBUG:"
    Rails.logger.info @results.inspect
  end
  
  def certificate
    require 'prawn'
  
    pdf = Prawn::Document.new
    pdf.font_families.update(
      "Amiri" => {
        normal:       Rails.root.join("app/assets/fonts/Amiri-Regular.ttf").to_s,
        bold:         Rails.root.join("app/assets/fonts/Amiri-Bold.ttf").to_s,
        italic:       Rails.root.join("app/assets/fonts/Amiri-Slanted.ttf").to_s,
        bold_italic:  Rails.root.join("app/assets/fonts/Amiri-BoldSlanted.ttf").to_s
      }
    )
  
    
    profile = current_user.profile
    full_name = if profile&.first_name.present? || profile&.last_name.present?
                  "#{profile&.first_name} #{profile&.last_name}".strip
                else
                  current_user.email
                end
  
    score = params[:score] || 0
    level = params[:level] || "Unknown Level"
  
    
    pdf.font("Amiri") do
      pdf.text "Certificate of Completion", size: 28, style: :bold, align: :center
      pdf.move_down 40
  
      pdf.text "This certifies that", align: :center, size: 18
      pdf.move_down 10
  
      pdf.text full_name, align: :center, size: 22, style: :bold
      pdf.move_down 10
  
      pdf.text "has successfully completed the quiz", align: :center, size: 16
      pdf.move_down 20
  
      pdf.text "Level: #{level}", align: :center, size: 14
      pdf.text "Total Score: #{score} points", align: :center, size: 14
      pdf.move_down 40
  
      pdf.text "Smart Maths4Kids", align: :center, size: 14, style: :italic
      pdf.move_down 10
      pdf.text Time.current.strftime("%B %d, %Y"), align: :center, size: 12
    end
  
    send_data pdf.render, filename: "certificate.pdf", type: "application/pdf", disposition: "inline"
  end
  
  
end
