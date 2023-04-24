# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let(:user) { create(:user) }
  let!(:stores) { create_list(:bookstore, 10) }
  let(:store_id) { Bookstore.first.id }
  let(:headers) { valid_headers }

  describe 'GET /bookstores' do
    # make HTTP get request before each example
    before { get '/bookstores', params: {}, headers: }

    it 'returns bookstores' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /bookstores/:id' do
    before { get "/bookstores/#{store_id}", params: {}, headers: }

    context 'when the record exists' do
      it 'returns the books' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(store_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:store_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/(.)+Couldn't find Bookstore(.)+/)
      end
    end
  end

  # Test suite for POST /bookstores
  describe 'POST /bookstores' do
    # valid payload
    let(:valid_attributes) do
      { name: 'Cornerstore',
        location: 'Berlin' }.to_json
    end

    context 'when the request is valid' do
      before { post '/bookstores', params: valid_attributes, headers: }

      it 'creates a store' do
        expect(json['name']).to eq('Cornerstore')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/bookstores', params: { name: 'Foobar' }.to_json, headers: }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Location can't be blank/)
      end
    end
  end

  # Test suite for PUT /bookstores/:id
  describe 'PUT /bookstores/:id' do
    let(:valid_attributes) { { name: 'Cornerstore' }.to_json }

    context 'when the record exists' do
      before { put "/bookstores/#{store_id}", params: valid_attributes, headers: }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /bookstores/:id
  describe 'DELETE /bookstores/:id' do
    before { delete "/bookstores/#{store_id}", headers: }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
