# frozen_string_literal: true

RSpec.shared_context 'shared context', shared_context: :metadata do
  let(:upload) do
    file = 'spec/fixtures/files/example_remit.png'
    u = Upload.new
    u.report.attach fixture_file_upload(file, 'image/png')
    u.save
    u
  end

  let(:setup) { import }

  def import
    @i ||= Import.new(upload.id).payments
  end

  let(:customer) { Customer.first }
  let(:payment) { customer.payments.first }
end
