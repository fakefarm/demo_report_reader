require 'rails_helper'

RSpec.describe ProcessReportJob, type: :job do
  it "#perform_later" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      ProcessReportJob.perform_later('process_id')
    }.to enqueue_job
  end
end
