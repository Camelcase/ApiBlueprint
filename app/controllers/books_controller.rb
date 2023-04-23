# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]

  def index = json_response(current_user.books.all)

  def create = json_response(current_user.books.create!(book_params))

  def show = json_response(@book)

  def update
    @book.update(book_params)
    head :no_content
  end

  def destroy
    @book.destroy
    head :no_content
  end

  private

  def book_params = params.permit(:title, :author)

  def set_book = @book = current_user.books.find(params[:id])
end
