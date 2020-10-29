# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.includes(:payments).find(params[:id])
    @reports = @customer.payments.order(date: :desc)
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end
end
