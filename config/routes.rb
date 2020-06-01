Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults:{ format: JSON } do
    resources :activities, only: [:index]
    resources :babies, only: [:index], param: :id do
      resources :activity_logs, only: [:index]
    end
    resources :activity_logs, only: [:create, :update, :index]
  end
end
