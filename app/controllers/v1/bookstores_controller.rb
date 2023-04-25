# frozen_string_literal: true

module V1
  class BookstoresController < ApplicationController
    before_action :set_book_store, only: %i[show update destroy]
    skip_before_action :authorize_request, only: :index

    def index = json_minimal_response(Bookstore.all)

    def create = json_response(Bookstore.create!(book_store_params))

    def show = json_response(@book_store)

    def book_list = json_response(BookstoreBook.where(bookstore_id: params[:bookstore_id]))

    def add_book
      return if BookstoreBook.find_by(bookstore_id: params[:bookstore_id], book_id: params[:book_id])

      json_response(BookstoreBook.create!(book_store_books_params))
    end

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

    def book_store_books_params = params.permit(:bookstore_id, :book_id)

    def set_book_store = @book_store = Bookstore.find(params[:id])
  end
end
