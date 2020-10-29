# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { is_expected.to have_db_column(:date) }
  it { is_expected.to have_db_column(:report_date) }
  it { is_expected.to have_db_column(:report_name) }
  it { is_expected.to have_db_column(:page) }
  it { is_expected.to have_db_column(:code) }
  it { is_expected.to have_db_column(:description) }
  it { should have_db_index(:customer_id) }
end
