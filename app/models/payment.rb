# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :customer
  has_many :lines, dependent: :destroy
  has_many :uploads, dependent: :destroy
end
