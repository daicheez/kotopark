Rails.application.routes.draw do
  get 'word_image_trainings/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root to: 'home#index'
  resources :users, only: :show

  get 'trainings/index'
  get 'trainings/2input'
  get 'trainings/3reading'
  get 'trainings/4image_moji_level'
  get 'trainings/easy1'
  get 'trainings/easy1_ans'
  get 'trainings/easy2'
  get 'trainings/easy3'
  get 'trainings/easy4'
  get 'trainings/easy5'
  get 'trainings/easy6'
  get 'trainings/easy7'
  get 'trainings/easy8'
  get 'trainings/easy9'
  get 'trainings/easy10'
end
