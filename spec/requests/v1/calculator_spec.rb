# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::Calculator', type: :request do
  describe 'GET /index successful' do
    let (:expression){ "3*5"}
    before do
      get '/calculator', params: { expression: }, headers:
    end

    context 'when the expression is correct' do
      it 'returns the result' do
        expect(json).not_to be_empty
        expect(json['result']).to eq(15)
      end
    end

    context 'when the expression is NOT correct' do
      let (:expression){ "some incorrect text"}
      it 'returns the result' do
        expect(json).not_to be_empty
        expect(json['result']).to eq("expression not processable")
      end
    end
  end
end


