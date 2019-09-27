require 'rails_helper'

RSpec.describe Item, type: :model do

  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:invoice) }

  # Validation tests
  # ensure columns title and created_by are present before saving

  # it { should validate_presence_of(:cost_price_usd) }
  # it { should validate_presence_of(:profit) }
  # it { should validate_presence_of(:total_cost_price_pyg) }
  # it { should validate_presence_of(:sales_price_pyg) }
end
