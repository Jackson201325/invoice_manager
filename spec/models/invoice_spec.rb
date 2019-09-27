require 'rails_helper'

# Test suit for Invoice model
RSpec.describe Invoice, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # Association test
  # Ensure Invoice has 1:m relationship with Item model
  it{ should have_many(:items).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving

  # it { should validate_presence_of(:total_spend) }
  # it { should validate_presence_of(:total_net_sales) }
  # it { should validate_presence_of(:total_profit) }

end
