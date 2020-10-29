# frozen_string_literal: true

class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.create(upload_params)
    ProcessReportJob.perform_later @upload.id
    redirect_to new_upload_path, notice: 'We are processing your report!'
  end

  private

  def upload_params
    params.require(:upload).permit(:report)
  end
end
