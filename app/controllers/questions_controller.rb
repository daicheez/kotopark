class QuestionsController < ApplicationController
  def create
    Question.new(prams[:content])
  end
end
