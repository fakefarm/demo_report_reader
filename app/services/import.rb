# frozen_string_literal: true

class Import
  def initialize(upload_id, customer: Customer, extract: Extract, payment: Payment, upload: Upload, line: Line)
    @upload_id = upload_id
    @upload = upload
    @extract = extract
    @customer = customer
    @line = line
    @payment = payment
    run
  end

  def run
    extract
    payments
    self
  end

  def extract
    load.report.open do |f|
      @file = @extract.new(f.path)
    end
    @file
  end

  def customer
    @cztmr ||= @customer.find_or_create_by(name: @file.company)
  end

  def report
    @report ||= @payment.find_or_create_by(report_attrs)
    assign_payment_to_upload
  end

  def payments
    @payments ||= @file.rows.each do |row|
      attrs = row.to_h.merge(payment_id: report.id)
      @line.create(attrs)
    end
  end

  def load
    @load ||= @upload.find(@upload_id)
  end

  private

  def report_attrs
    @file.to_h.merge(customer: customer)
  end

  def assign_payment_to_upload
    load.update(payment_id: @report.id)
    @report
  end
end
