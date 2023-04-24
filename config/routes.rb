# frozen_string_literal: true

Rails.application.routes.draw do
  # root "articles#index"

  Rails.application.routes.draw do
    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'

    scope module: :v1, constraints: ApiVersion.new('v1', true) do
      resources :books, defaults: { format: :json } do
      end
    end
    scope module: :v2, constraints: ApiVersion.new('v2') do
      resources :books, only: :index
    end

    # resources :bookstores do
    #  resources :bookstore
    # end
  end
end
