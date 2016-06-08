require 'rails_helper'

RSpec.describe Deck, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @deck = FactoryGirl.build(:deck, user_id: @user[:id])
  end
  subject { @deck }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should be_valid }
end
