Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#landing_page"
  get "/about", to: "home#about_us"


  resources :movies, only: [:index, :show] do

  end
end
