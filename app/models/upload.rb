# frozen_string_literal: true

class Upload < ApplicationRecord
  belongs_to :report
  has_one_attached :report
end
