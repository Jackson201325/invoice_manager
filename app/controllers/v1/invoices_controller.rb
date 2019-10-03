module V1
  class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show update destroy]

  # GET /invoices
  def index
    puts 'hello'
    @invoices = current_user.invoices
    json_response(@invoices)
  end

  # POST /invoices
  def create
    # In our create method in the InvoicesController, note that we're using create!
    # instead of create. This way, the model will raise an exception
    # ActiveRecord::RecordInvalid. This way, we can avoid deep nested if
    # statements in the controller. Thus, we rescue from this exception in the
    # ExceptionHandler module.
    @invoice = current_user.invoices.create!(invoice_params)
    json_response(@invoice, :created)
  end

  # GET /invoices/:id
  def show
    json_response(@invoice)
  end

  # PUT /invoices/:id
  def update
    @invoice.update(invoice_params)
    head :no_content
  end

  # DELETE /invoices/:id
  def destroy
    @invoice.destroy
    head :no_content
  end

  private

  def invoice_params
    # whitelist params
    params.permit(:total_spend, :total_net_sales, :total_profit)
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
end
end