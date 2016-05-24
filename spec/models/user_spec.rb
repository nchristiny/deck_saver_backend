require 'rails_helper'

RSpec.describe User, :type => :model do
  before { @user = FactoryGirl.build(:user) }
  subject { @user }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should_not allow_value('invalid_email@@example.net').for(:email) }
  it { should be_valid }
end
