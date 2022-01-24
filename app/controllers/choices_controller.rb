class ChoicesController < ApplicationController
  def create
    Choice.new(params[:answer])
  end
end
