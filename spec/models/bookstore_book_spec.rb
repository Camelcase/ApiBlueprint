# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookstoreBook, type: :model do
  it { should belong_to(:book) }
  it { should belong_to(:bookstore) }
end
