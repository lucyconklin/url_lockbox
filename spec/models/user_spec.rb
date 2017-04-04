require 'rails_helper'

RSpec.describe User, type: :model do
  context "relationships" do
    it { should have_many(:links) }
    it { should validate_uniqueness_of(:email) }
  end
end
