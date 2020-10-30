# frozen_string_literal: true

module ApplicationHelper
  def no_data?
    Customer.count.zero?
  end
end
