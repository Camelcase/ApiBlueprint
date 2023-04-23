# frozen_string_literal: true

FactoryBot.define do
  factory :bookstore do
    name { Faker::Lorem.word }
    location { Faker::Lorem.word }
  end
end
