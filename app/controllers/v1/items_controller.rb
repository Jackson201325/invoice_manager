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
    json_response(@item)
  end

  # POST /invoices/:todo_id/items
  def create
    @invoice.items.create!(item_params)
    json_response(@todo, :created)
  end

  # PUT /invoices/:todo_id/items/:id
  def update
    @item.update(item_params)
    head :no_content
  end

  # DELETE /invoices/:todo_id/items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :description, :company, :url, :cost_price, :order)
  end

  def set_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end

  def set_invoice_item
    @item = @invoice.items.find_by!(id: params[:id]) if @invoice
  end
end

end