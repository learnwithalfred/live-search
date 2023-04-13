require 'rails_helper'

RSpec.describe Search, type: :model do
  # Validations
  it { should validate_presence_of(:query) }
  it { should validate_length_of(:query).is_at_most(255) }

  # Associations
  it { should belong_to(:user) }
end
