# frozen_string_literal: true

class Bookstore < ApplicationRecord
  validates :name, :location, presence: true
  has_many :BookstoreBook
end
