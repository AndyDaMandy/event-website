Rails.application.routes.draw do
  devise_for :users
  get 'events/index'
  root 'events#index'
  resources :users do
    resources :events
  end
  resources :event_view do
    get :attend
    get :remove_attend
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
