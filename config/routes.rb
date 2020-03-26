Rails.application.routes.draw do

  root "homes#index"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:show] do
    resources :messages
  end
  resources :shops, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :shops, only: [:show] do
    resources :photos
    resources :schedules, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  resources :schedules, only: [:index]
  resources :rooms
  
  resources :inquiries do
    resources :answers
  end
  
end
