# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Lorem.word }
    author { Faker::Lorem.word }
    user_id { 1 }
  end
end
