# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /searches' do
    it 'ok' do
      get '/searches'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /searches/new' do
    it 'ok' do
      get '/searches/new'
      expect(response).to have_http_status(:ok)
    end
  end
end
