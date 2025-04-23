class ScoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @scores = current_user.scores.order(created_at: :desc)
  end

  def show
    @score = current_user.scores.find(params[:id])
  end
end
