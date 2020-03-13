Rails.application.routes.draw do
  devise_for :admins
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :admins, only: [:show]
  resources :interviews
  resources :participants
  resources :interview_participants
end
