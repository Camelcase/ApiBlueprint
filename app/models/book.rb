# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :BookstoreBook

  validates :title, :author, presence: true
end
