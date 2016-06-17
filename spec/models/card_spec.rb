require 'rails_helper'

RSpec.describe Card, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @deck = FactoryGirl.create(:deck, user_id: @user[:id])
    @card = FactoryGirl.build(:card, deck_id: @deck[:id])
  end
  subject { @card }

  it { should validate_presence_of(:cardId) }
  it { should validate_uniqueness_of(:cardId) }
  it { should }

  it { should be_valid }
end
