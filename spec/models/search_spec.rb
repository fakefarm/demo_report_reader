# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search, type: :model do
  it { is_expected.to have_db_column(:term) }
end
