Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root to: "products#index"

    get "sign_in", to: "sessions#new"
    post "sign_in", to: "sessions#create"
    delete "sign_out", to: "sessions#destroy"

    resources :products, only: [:index, :show]
    resources :orders, only: [:new, :create]
    resources :carts, only: [:index, :create, :update, :destroy]
  end
end
