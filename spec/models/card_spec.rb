require 'rails_helper'

RSpec.describe Card, type: :model do
  before(:each) do
    @card = FactoryGirl.build(:card)
  end
  subject { @card }

  it { should validate_presence_of(:cardId) }
  it { should have_many :decks }
  it { should have_many :deck_cards }

  it { should be_valid }
end
