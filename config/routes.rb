# frozen_string_literal: true

Rails.application.routes.draw do
  # root "articles#index"

  Rails.application.routes.draw do
    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'

    resources :books, defaults: { format: :json } do
      #   resources :book
    end
    # resources :bookstores do
    #  resources :bookstore
    # end
  end
end
