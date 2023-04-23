# frozen_string_literal: true

class BooksController < ApplicationController
  include Response

  before_action :set_book, only: %i[show update destroy]

  def index = json_response(Book.all)

  def create = json_response(Book.create!(book_params))

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

  def set_book = @book = Book.find(params[:id])
end
