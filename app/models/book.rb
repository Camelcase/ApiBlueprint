class Book < ApplicationRecord
  has_many :BookstoreBook

  validates_presence_of :title, :author
end


