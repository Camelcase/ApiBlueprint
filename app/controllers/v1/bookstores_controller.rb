# frozen_string_literal: true

module V1
  class BookstoresController < ApplicationController
    before_action :set_book_store, only: %i[show update destroy]

    def index = json_response(Bookstore.all)

    def create = json_response(Bookstore.create!(book_store_params))

    def show = json_response(@book_store)

    def update
      @book_store.update(book_store_params)
      head :no_content
    end

    def destroy
      @book_store.destroy
      head :no_content
    end

    private

    def book_store_params = params.permit(:name, :location)

    def set_book_store = @book_store = Bookstore.find(params[:id])

  end
end
