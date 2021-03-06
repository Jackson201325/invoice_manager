require 'rails_helper'

RSpec.describe 'Invoice API', type: :request do
  let(:user) { create(:user) }
  # initialize test data
  let!(:invoices) do
    create_list(:invoice, 9, created_by: user.id)
  end
  let(:invoice_id) { invoices.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /invoices
  describe 'GET /invoices' do
    # make HTTP get request before each example
    before { get '/invoices', params: {}, headers: headers }

    it 'returns invoices' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /invoices/:id
  describe 'GET /invoices/:id' do
    before { get "/invoices/#{invoice_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the item' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(invoice_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:invoice_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Invoice/)
      end
    end
  end

  # Test suite for POST /invoices
  describe 'POST /invoices' do
    # valid payload
    let(:valid_attributes) do
      { total_spend: 1_500_000,
        total_net_sales: 2_500_000,
        created_by: user.id.to_s }.to_json
    end

    context 'when the request is valid' do
      before { post '/invoices', params: valid_attributes, headers: headers }

      it 'creates a invoice' do
        expect(json['total_spend']).to eq(1_500_000)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/invoices', params: { total_spend: 'Foobar' }.to_json, headers:headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Total spend Must be a number/)
      end
    end
  end

  # Test suite for PUT /invoices/:id
  describe 'PUT /invoices/:id' do
    let(:valid_attributes) do
      { total_spend: 1_500_000,
        total_net_sales: 2_500_000 }.to_json
    end

    context 'when the record exists' do
      before { put "/invoices/#{invoice_id}", params: valid_attributes, headers:headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /invoices/:id
  describe 'DELETE /invoices/:id' do
    before { delete "/invoices/#{invoice_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
