Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root to: 'home#index'
  resources :users, only: :show
  resources :trainings, only: [:index, :create]

  get 'trainings/index'
  get 'trainings/2reading'
  get 'trainings/3image_word_level'
  get 'trainings/easy1'

end