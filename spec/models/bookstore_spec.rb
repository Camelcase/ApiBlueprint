# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bookstore, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should have_many(:BookstoreBook) }
end
