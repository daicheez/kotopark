Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root to: 'home#index'
  resources :users, only: :show

  get 'trainings/index'
  get 'trainings/2reading'
  get 'trainings/3image_word_level'
  get 'questions/easy1'
  get 'choices/easy1_ans'

end
