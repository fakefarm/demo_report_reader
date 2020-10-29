# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :customer
  has_many :lines
  has_many :uploads
end
