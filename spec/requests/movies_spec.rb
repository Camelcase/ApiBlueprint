# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  let(:query) { 'Star Wars' }
  let(:cassette_name) { 'Starwars' }

  describe 'GET /movies successfully' do
    before do
      VCR.turn_on!
      VCR.use_cassette(cassette_name, { record: :new_episodes }) do
        get '/movies', params: { query: }, headers:
      end
    end

    it 'works and returns star wars movies' do
      expect(json).not_to be_empty
      expect(json['movies'][0]).to eq({ 'title' => "Doraemon: Nobita's Little Star Wars 2021",
                                        'poster_image' => '/48gKZioIDeUOI0afbYv3kh9u9RQ.jpg' })
    end

    it 'returns 20 Movies' do
      expect(json['movies'].size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /movies with problems' do
    before do
      VCR.turn_off!
      stub_request(:get, %r{https://api.themoviedb.org(.)+}).to_return(status: 400)

      get '/movies', params: { query: }, headers:
    end

    it 'movie api fails and returns api error' do
      expect(json).not_to be_empty
      expect(json['status']).to eq('Movie API Error')
    end

    it 'returns status code 400' do
      expect(response).to have_http_status(:bad_request)
    end
  end
end
