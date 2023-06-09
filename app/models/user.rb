# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :books, dependent: :nullify

  validates :name, :email, :password_digest, presence: true
end
