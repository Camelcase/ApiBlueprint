# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  describe 'GET /movies' do
    let (:query) { 'Star Wars' }
    #let(:sample_data) { JSON.parse(File.read('spec/support/movie_api_result_sample.json')) }
    # make HTTP get request before each example


    before {
      WebMock.stub_request(:get, "https://api.themoviedb.org/3/search/movie?query='#{query}'&language=en-US")
            .to_return(:status => 200, :body => File.read('spec/support/movie_api_result_sample.json'))

      get '/movies', params: { query: }, headers:
    }

    it 'returns star wars movies' do
      expect(json).not_to be_empty
      expect(json['movies'][0]).to eq({"title"=>"Doraemon: Nobita's Little Star Wars 2021", "poster_image"=>"/48gKZioIDeUOI0afbYv3kh9u9RQ.jpg"})
      #expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end
