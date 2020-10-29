# frozen_string_literal: true

class PaymentsController < ApplicationController
  def show
    @payment = Payment.find(params[:id])
  end
end
