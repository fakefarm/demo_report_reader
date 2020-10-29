# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  describe 'GET /customers' do
    it 'code' do
      get '/customers'
      expect(response).to have_http_status(200)
    end
  end
end
