require 'rails_helper'

RSpec.describe Link, type: :model do
  context "relationships" do
    it { should belong_to(:user) }
  end

  context "validataions" do
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
    it { should validate_presence_of(:title) }
  end
end
