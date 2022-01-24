Rails.application.routes.draw do
  get 'choices/create'
  get 'word_image_trainings/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root to: 'home#index'
  resources :users, only: :show
  resources :choices, only: :create

  get 'trainings/index'
  get 'trainings/2reading'
  get 'trainings/3image_word_level'
  get 'questions/easy1'
  get 'choices/easy1_ans'
  get 'questions/easy2'
  get 'questions/easy3'
  get 'questions/easy4'
  get 'questions/easy5'
  get 'questions/easy6'
  get 'questions/easy7'
  get 'questions/easy8'
  get 'questions/easy9'
  get 'questions/easy10'
end
