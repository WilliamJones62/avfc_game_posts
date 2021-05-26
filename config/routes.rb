Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :games, param: :formatted_date
      resources :reviews
    end
  end
  get 'matches/main'
  root 'matches#main'
end
