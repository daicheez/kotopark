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
  get 'word_image_trainings/easy1'
  get 'word_image_trainings/easy1_ans'
  get 'word_image_trainings/easy2'
  get 'word_image_trainings/easy3'
  get 'word_image_trainings/easy4'
  get 'word_image_trainings/easy5'
  get 'word_image_trainings/easy6'
  get 'word_image_trainings/easy7'
  get 'word_image_trainings/easy8'
  get 'word_image_trainings/easy9'
  get 'word_image_trainings/easy10'
end
