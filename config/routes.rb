Rails.application.routes.draw do
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
  get 'word_image_training/easy1'
  get 'word_image_training/easy1_ans'
  get 'word_image_training/easy2'
  get 'word_image_training/easy3'
  get 'word_image_training/easy4'
  get 'word_image_training/easy5'
  get 'word_image_training/easy6'
  get 'word_image_training/easy7'
  get 'word_image_training/easy8'
  get 'word_image_training/easy9'
  get 'word_image_training/easy10'
end
