# spec/requests/items_spec.rb
require 'rails_helper'

RSpec.describe 'Items API' do
  # Initialize the test data
  let(:user) { create(:user) }
  let!(:invoice) { create(:invoice, created_by: user.id) }
  let!(:items) { create_list(:item, 20, invoice_id: invoice.id) }
  let(:invoice_id) { invoice.id }
  let(:id) { items.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /invoices/:invoice_id/items
  describe 'GET /invoices/:invoice_id/items' do
    before { get "/invoices/#{invoice_id}/items", params: {}, headers: headers  }

    context 'when invoice exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all invoice items' do
        expect(json.size).to eq(20)
      end
    end

    context 'when invoice does not exist' do
      let(:invoice_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Invoice/)
      end
    end
  end

  # Test suite for GET /invoices/:invoice_id/items/:id
  describe 'GET /invoices/:invoice_id/items/:id' do
    before { get "/invoices/#{invoice_id}/items/#{id}", params: {}, headers: headers }

    context 'when invoice item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when invoice item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for PUT /invoices/:invoice_id/items
  describe 'POST /invoices/:invoice_id/items' do
    let(:valid_attributes) do
      { name: 'iPhone 11', description: 'Very expensive',
        company: 'Apple', url: 'www.apple.com', cost_price_usd: 1000,
        order: 4 }.to_json
    end

    context 'when request attributes are valid' do
      before { post "/invoices/#{invoice_id}/items", params: valid_attributes, headers:headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/invoices/#{invoice_id}/items", params: {}, headers:headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /invoices/:todo_id/items/:id
  describe 'PUT /invoices/:invoice_id/items/:id' do
    let(:valid_attributes) do
      { name: 'iPhone 11', description: 'Very expensive',
        company: 'Apple', url: 'www.apple.com', cost_price_usd: 1000,
        order: 4 }.to_json
    end

    before { put "/invoices/#{invoice_id}/items/#{id}", params: valid_attributes, headers:headers }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = Item.find(id)
        expect(updated_item.name).to match(/iPhone 11/)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for DELETE /invoices/:id
  describe 'DELETE /invoices/:id' do
    before { delete "/invoices/#{invoice_id}/items/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end