require 'rails_helper'

RSpec.describe SavedCard, type: :model do
  before(:each) do
    @saved_card = FactoryGirl.build(:saved_card)
  end
  subject { @saved_card }

  it { should belong_to :user }
  it { should belong_to :card }
  it { should be_valid }
end
