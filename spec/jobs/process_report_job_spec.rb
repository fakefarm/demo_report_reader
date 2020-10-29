# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProcessReportJob, type: :job do
  it '#perform_later' do
    ActiveJob::Base.queue_adapter = :test
    expect do
      ProcessReportJob.perform_later('process_id')
    end.to enqueue_job
  end
end
