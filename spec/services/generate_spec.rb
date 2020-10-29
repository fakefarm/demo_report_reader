# frozen_string_literal: true

require 'rails_helper'
require 'shared_context'

RSpec.describe Generate do
  include_context 'shared context'

  subject { Generate.new(upload.id) }

  before { setup }

  it 'payment' do
    expect(subject.payment).to be_instance_of(Payment)
  end

  it 'Creates an Upload' do
    expect { subject.report }.to change { Upload.count }.from(1).to(2)
  end
end
