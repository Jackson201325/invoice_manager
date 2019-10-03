class V2::InvoicesController < ApplicationController
  def index
    json_response({ message: 'Hello there'})
  end
end
