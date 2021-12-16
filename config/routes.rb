Rails.application.routes.draw do
  root "movies#index"
  get "/about", to: "home#about_us"

  resources :movies, only: [:index, :show] do
  end
end
