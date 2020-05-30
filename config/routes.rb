Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :activities, only: [:index]
    resources :babies, only: [:index, :show]
    resources :activity_logs, only: [:index, :update]
  end
end
