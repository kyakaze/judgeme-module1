Rails.application.routes.draw do
  root "movies#index"
  get "/about", to: "home#about_us"
  get "/search", to: "movies#search"
  resources :movies, only: [:index, :show] do
  end
end
