# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :lines, through: :payments
  validates :name, presence: true
end
