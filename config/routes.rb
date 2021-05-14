Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :games
      resources :reviews
    end
  end
end
