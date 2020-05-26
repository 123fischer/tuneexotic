Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tunes do
    resources :requests, only: [:new, :create]
    resources :favorites, only: [:new, :create, :show, :destroy]
  end
  patch "requests/:id/accept", to: "requests#accept", as: :accept_request
  patch "requests/:id/reject", to: "requests#reject", as: :reject_request
end
