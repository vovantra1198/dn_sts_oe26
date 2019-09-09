Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/signup", to: "users#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/confirm_email", to: "users#confirm_email"
    post "/confirm_email", to: "users#check_code"

    resources :users, only: [:new, :create, :show]
    resources :notifications, only: [:new, :create, :detroy]
    mount ActionCable.server => "/cable"
  end
  resources :courses, only: [:index, :show]
  post "/login", to: "sessions#create"
  get "/notfound", to: "courses#notfound"
  delete "/logout", to: "sessions#destroy"
end
