require 'rails_helper'

RSpec.describe Article, type: :model do
  # Validations
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_least(3) }

  # Associations
  it { should belong_to(:user) }
end
