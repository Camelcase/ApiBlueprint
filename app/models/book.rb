# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :BookstoreBook, dependent: :delete_all

  validates :title, :author, presence: true
end
