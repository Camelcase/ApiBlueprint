# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :BookstoreBook

  validates_presence_of :title, :author
end
