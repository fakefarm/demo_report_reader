# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :payments
  validates :name, presence: true
end
