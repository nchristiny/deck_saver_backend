require 'rails_helper'

RSpec.describe Deck, type: :model do
  before(:each) do
    @deck = FactoryGirl.build(:deck)
  end
  subject { @deck }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should belong_to :user }
  it { should have_many :deck_cards }

  it { should be_valid }
end
