# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies::Steps::QueryMovieApi do
  let(:query) { 'Star Wars' }
  let(:cassette_name) { 'Starwars' }
  let(:subject) { described_class.call(query:) }
  let(:movie_db_url) { %r{https://api.themoviedb.org(.)+} }
  let(:response_body) do
  { results: [{ title: 't1', poster_image: 'p1' },
              { title: 't2', poster_image: 'p2' },
              { title: 't3', poster_image: 'p3' }] }.to_json
end

  describe '.call success' do
    before do
      stub_request(:get, movie_db_url).to_return(body: response_body, status: 200)
    end

    it 'returns 3 Movies' do
      expect(subject.movies['results'].size).to eq(3)
    end
  end
  describe '.call fail' do
    before do
      stub_request(:get, movie_db_url).to_return(status: 400)
    end

    it 'fails, return a error message' do
      expect(subject.status).to eq(:bad_request)
      expect(subject.result).to eq({ status: 'Movie API Error' })
    end
  end
end
