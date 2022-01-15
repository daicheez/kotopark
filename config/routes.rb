Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users#registrations',
    sessions: 'users/sessions',
  }
  root to: 'home#index'
  get 'trainings/index'
  get 'trainings/2input'
  get 'trainings/3reading'
  get 'trainings/4image_moji_level'
  get 'trainings/tr_i_m_e1'
  get 'trainings/tr_i_m_e1_ans'
  get 'trainings/tr_i_m_e2'
  get 'trainings/tr_i_m_e3'
  get 'trainings/tr_i_m_e4'
  get 'trainings/tr_i_m_e5'
  get 'trainings/tr_i_m_e6'
  get 'trainings/tr_i_m_e7'
  get 'trainings/tr_i_m_e8'
  get 'trainings/tr_i_m_e9'
  get 'trainings/tr_i_m_e10'
end
