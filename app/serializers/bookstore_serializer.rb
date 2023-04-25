# frozen_string_literal: true

class BookstoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :location
  attribute :books_available, unless: :minimal?

  def minimal? = @instance_options[:minimal] == true

  def books_available
    books = @object.BookstoreBook
    return 'None' if books.size.zero?

    books.map do
      {
        title: _1.book.title,
        author: _1.book.author
      }
    end
  end
end
