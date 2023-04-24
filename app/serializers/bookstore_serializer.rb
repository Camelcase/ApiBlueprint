# frozen_string_literal: true

class BookstoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :location

  # def books_available
  #  self.BookstoreBook.all.map{
  #     { test: 'i dunno'}
  #  }
  # end

  # def attributes
  #  { test: 'what do i know' }
  # end
end
