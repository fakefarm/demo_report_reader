# frozen_string_literal: true

require 'rails_helper'
require 'shared_context'

RSpec.describe Import do
  include_context 'shared context'

  subject { Import.new(upload.id) }

  it 'Creates a Customer' do
    expect { subject.customer }.to change { Customer.count }.from(0).to(1)
  end

  it 'Creates a Payment Report' do
    expect { subject.report }.to change { Payment.count }.from(0).to(1)
  end

  it 'Creates Payment Lines' do
    expect { subject.payments }.to change { Line.count }.from(0).to(30)
  end

  it 'Assigns a Payment to Upload' do
    expect(subject.load.payment_id).to eq(subject.report.id)
  end

  it 'Extracts Report from Upload' do
    expect(subject.extract).to be_instance_of(Extract)
  end
end
