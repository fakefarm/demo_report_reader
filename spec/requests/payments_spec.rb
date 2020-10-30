# frozen_string_literal: true

require 'rails_helper'
require 'shared_context'
RSpec.describe 'Payments', type: :request do
  include_context 'shared context'

  before { setup }

  describe 'GET /payments' do
    it 'ok' do
      report_id = customer.payments.first.id
      get "/customers/#{customer.id}/reports/#{report_id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
