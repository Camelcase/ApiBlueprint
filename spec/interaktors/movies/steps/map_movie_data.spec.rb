# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies::Steps::MapMovieData do
  let(:subject) { described_class.call(movies:) }
  let(:movies)  do
    {
      results: [{ title: 't1', poster_image: 'p1' },
                { title: 't2', poster_image: 'p2' },
                { title: 't3', poster_image: 'p3' }]
    }.deep_stringify_keys
  end

  describe '.call success' do
    it 'returns 3 Movies' do
      expect(subject.result[:movies].size).to eq(3)
      expect(subject.result[:movies][0][:title]).to eq('t1')
    end
  end
end
