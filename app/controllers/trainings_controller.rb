class TrainingsController < ApplicationController
  def index
  end

  def create
    Training.new(params[:training_at])
  end

end
