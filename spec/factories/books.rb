# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Lorem.word }
    author { Faker::Lorem.word }
    # author { Faker::Number.number(10) }
  end
end
