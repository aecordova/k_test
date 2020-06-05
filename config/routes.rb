Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'activity_logs#index'

  namespace :api, defaults:{ format: JSON } do
    resources :activities, only: [:index]
    resources :assistants, only: [:index]
    resources :babies, only: [:index], param: :id do
      resources :activity_logs, only: [:index]
    end
    resources :activity_logs, only: [:create, :update, :index]
  end

  get '/signup', to: 'users#new';
  post '/signup', to: 'users#create';

  get '/login', to: 'sessions#new';
  post '/login', to: 'sessions#create';
  
  get '/logout', to: 'sessions#destroy';

  resources :activity_logs, only: [:index]

end
