# frozen_string_literal: true

class Bookstore < ApplicationRecord
  validates_presence_of :name, :location
  has_many :BookstoreBook
end
