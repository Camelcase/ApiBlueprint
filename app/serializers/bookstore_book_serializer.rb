# frozen_string_literal: true

class BookstoreBookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author

  def title = @object.book.title
  def author = @object.book.author
end
