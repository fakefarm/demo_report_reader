# frozen_string_literal: true

require 'rails_helper'
require 'shared_context'

RSpec.describe SearchService do
  include_context 'shared context'

  let(:search) { Search.create(term: term) }

  before do
    setup
    search
  end

  context 'string' do
    let(:term) { 'Rabco' }
    it { expect(subject.query.first).to be_instance_of(Payment) }
  end

  context 'decimal' do
    let(:term) { '43' }
    it { expect(subject.query.first).to be_instance_of(Payment) }
  end

  context 'date' do
    let(:term) { '2015' }
    it { expect(subject.query.first).to be_instance_of(Payment) }
  end

  context 'code' do
    let(:term) { 'FNBMDCK' }
    it { expect(subject.query.first).to be_instance_of(Payment) }
  end
end
