# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Row do
  let(:line) { '12/15/2015 4656781 1733-182 $43.31 $3,875.67 $3,832.36' }

  subject { Row.new(line) }

  let(:date) { Date.new(2015, 12, 15) }
  let(:invoice) { '4656781' }
  let(:description) { '1733-182' }
  let(:discount) { 43.31 }
  let(:amount) { 3875.67 }
  let(:net) { 3832.36 }

  let(:line_hash) do
    {
      date: date,
      invoice: invoice,
      description: description,
      discount: discount,
      amount: amount,
      net: net
    }
  end

  describe 'API' do
    it '#to_h' do
      expect(subject.to_h).to eq(line_hash)
    end

    it '#date' do
      expect(subject.date).to eq(date)
    end

    it '#invoice' do
      expect(subject.invoice).to eq(invoice)
    end

    it '#description' do
      expect(subject.description).to eq(description)
    end

    it '#discount' do
      expect(subject.discount).to eq(discount)
    end

    it '#amount' do
      expect(subject.amount).to eq(amount)
    end

    it '#net' do
      expect(subject.net).to eq(net)
    end
  end
end
