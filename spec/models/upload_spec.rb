# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Upload, type: :model do
  it { is_expected.to have_db_column(:payment_id) }
  it { should have_db_index(:payment_id) }
end
