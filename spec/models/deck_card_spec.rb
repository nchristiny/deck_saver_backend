require 'rails_helper'

RSpec.describe DeckCard, type: :model do
  before(:each) do
    @deck_card = FactoryGirl.build(:deck_card)
  end
  subject { @deck_card }

  it { should belong_to :card }
  it { should belong_to :deck }
  it { should be_valid }
end
