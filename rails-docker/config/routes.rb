Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :notes do
        get 'fetch', on: :collection
      end
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
  # root "posts#index"
end
