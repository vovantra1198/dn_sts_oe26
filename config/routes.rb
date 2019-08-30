Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/signup", to: "users#new"
    resources :users, only: [:new, :create]
  end
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
