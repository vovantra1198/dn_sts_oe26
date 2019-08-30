Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/signup", to: "users#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/confirm_email", to: "users#confirm_email"
    post "/confirm_email", to: "users#check_code"
    resources :notifications, only: [:new, :create, :detroy]
    mount ActionCable.server => "/cable"
  end
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :courses, only: [:index, :show] do
    resources :subjects, only: [:show]
  end
  resources :user_course_tasks, only: [:new, :create]

  post "/login", to: "sessions#create"
  get "/notfound", to: "courses#notfound"
  delete "/logout", to: "sessions#destroy"
end
