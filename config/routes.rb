# frozen_string_literal: true

Rails.application.routes.draw do
  # root "articles#index"

  Rails.application.routes.draw do
    # namespace :api, defaults: { format: :json } do
    # namespace :v1 do
    #  resources :books
    #  resources :bookstores
    # end
    # end

    resources :books, defaults: { format: :json } do
      #   resources :book
    end
    # resources :bookstores do
    #  resources :bookstore
    # end
  end
end
