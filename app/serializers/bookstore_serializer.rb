# frozen_string_literal: true

class BookstoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :location
end
