# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Line, type: :model do
  it { is_expected.to have_db_column(:date) }
  it { is_expected.to have_db_column(:invoice) }
  it { is_expected.to have_db_column(:description) }
  it { is_expected.to have_db_column(:discount) }
  it { is_expected.to have_db_column(:amount) }
  it { is_expected.to have_db_column(:net) }
  it { is_expected.to have_db_column(:payment_id) }
  it { should have_db_index(:payment_id) }
end
