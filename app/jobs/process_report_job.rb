# frozen_string_literal: true

class ProcessReportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    id = args[0]
    Import.new(id)
    Generate.new(id).report
  end
end
