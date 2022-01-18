Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :numbers, only: %i[ index ]
  end

  resource '*a', to: 'application#not_found'
end
