class ScoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_score, only: %i[show edit update destroy]

  def index
    @scores = current_user.scores.order(created_at: :desc)
  end

  def show
  end

  def new
    @score = current_user.scores.new
  end

  def create
    @score = current_user.scores.new(score_params)
    if @score.save
      redirect_to @score, notice: 'Score was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @score.update(score_params)
      redirect_to @score, notice: 'Score was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @score.destroy
    redirect_to scores_path, notice: 'Score was successfully destroyed.'
  end

  private

  def set_score
    @score = current_user.scores.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to scores_path, alert: 'Score not found.'
  end

  def score_params
    params.require(:score).permit(:score, :attempted_at)
  end
end
