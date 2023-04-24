# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let(:user) { create(:user) }
  let!(:books) { create_list(:book, 10, user_id: user.id) }
  let(:book_id) { books.first.id }
  let(:headers) { valid_headers }

  describe 'GET /books' do
    # make HTTP get request before each example
    before { get '/books', params: {}, headers: }

    it 'returns books' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /books/:id' do
    before { get "/books/#{book_id}", params: {}, headers: }

    context 'when the record exists' do
      it 'returns the books' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(book_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:book_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Book/)
      end
    end
  end

  # Test suite for POST /books
  describe 'POST /books' do
    # valid payload
    let(:valid_attributes) do
      { title: 'Learn Elm',
        author: 'somedude' }.to_json
    end

    context 'when the request is valid' do
      before { post '/books', params: valid_attributes, headers: }

      it 'creates a todo' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/books', params: { title: 'Foobar' }.to_json, headers: }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Author can't be blank/)
      end
    end
  end

  # Test suite for PUT /books/:id
  describe 'PUT /books/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/books/#{book_id}", params: valid_attributes, headers: }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /books/:id
  describe 'DELETE /books/:id' do
    before { delete "/books/#{book_id}", headers: }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
