class TrainingsController < ApplicationController
  def index
  end

  def create
    Training.new(params[:category, :sub_category, :level])
  end
end
