# frozen_string_literal: true

class BookstoreBook < ApplicationRecord
  belongs_to :book, dependent: :destroy_async
  belongs_to :bookstore, dependent: :destroy_async
end
