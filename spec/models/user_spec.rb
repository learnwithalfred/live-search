require 'rails_helper'

RSpec.describe User, type: :model do
  # Validations
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }
  it { should validate_presence_of(:image) }

  # Associations
  it { should have_many(:articles) }
end
