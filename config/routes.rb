# frozen_string_literal: true

Rails.application.routes.draw do
  # root "articles#index"

  Rails.application.routes.draw do
    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'

    scope module: :v1, constraints: ApiVersion.new('v1', true) do
      resources :books, defaults: { format: :json }
      resources :bookstores, defaults: { format: :json }
      post 'bookstores/add_book', defaults: { format: :json }, to: 'bookstores#add_book'
      post 'bookstores/list_books', defaults: { format: :json }, to: 'bookstores#book_list'
      get 'movies', defaults: { format: :json }, to: 'movies#index'
    end

    scope module: :v2, constraints: ApiVersion.new('v2', false) do
      resources :books, only: :index
    end
  end
end
