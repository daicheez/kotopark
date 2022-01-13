Rails.application.routes.draw do
  
  get 'trainings/index'
  root to: 'home#index'
end
