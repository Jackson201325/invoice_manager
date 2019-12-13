module V1

  class ItemsController < ApplicationController
    before_action :set_invoice
    before_action :set_invoice_item, only: %i[show update destroy]

    # GET /invoices/:todo_id/items
    def index
      json_response(@invoice.items)
    end

    # GET /invoices/:todo_id/items/:id
    def show
      json_response(@invoice.items)
    end

    # POST /invoices/:invoice_id/items
    def create
      @invoice.items.create!(item_params)
      json_response(@invoice.items, :created)
    end

    # PUT /invoices/:invoice_id/items/:id
    def update
      @invoice.items.update(item_params)
      head :no_content
    end

    # DELETE /invoices/:todo_id/items/:id
    def destroy
      @invoice.items.destroy
      head :no_content
    end

  private

    def item_params
      params.permit(:name, :model, :description, :color, :year, :company,
                    :color, :url, :cost_price, :sales_price, :order,
                    :total_revenue, :total_cost, :profit, :confirm, :invoice_id)
    end

    def set_invoice
      puts params[:invoice_id]
      @invoice = Invoice.find(params[:invoice_id])
    end

    def set_invoice_item
      @invoice = Invoice.find(params[:invoice_id])
      @item = @invoice.items.find_by!(id: params[:id]) if @invoice
    end
  end
end