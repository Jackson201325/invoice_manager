require 'rails_helper'

RSpec.describe Item, type: :model do

  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:invoice) }

  # Validation tests
  # ensure columns title and created_by are present before saving

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:company) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:cost_price_usd) }
  it { should validate_presence_of(:order) }
end
