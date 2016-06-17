require 'rails_helper'

RSpec.describe Card, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @deck = FactoryGirl.create(:deck)
    @card = FactoryGirl.build(:card)
  end
  subject { @card }

  it { should validate_presence_of(:cardId) }
  it { should validate_uniqueness_of(:cardId) }
  it { should have_many :decks }

  it { should be_valid }
end
