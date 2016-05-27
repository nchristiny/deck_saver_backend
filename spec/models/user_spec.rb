require 'rails_helper'

RSpec.describe User, :type => :model do
  before { @user = FactoryGirl.build(:user) }
  subject { @user }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should_not allow_value('invalidemail@example,net').for(:email) }

  it { should respond_to(:api_key) }
  it { should validate_uniqueness_of(:api_key)}

  describe "#generate_api_key" do
    it "generates a token" do
      generated_token = @user.api_key
      expect(@user.api_key).to eql generated_token
    end

    it "regenerates a new token" do
      api_key = @user.api_key
      @user.regenerate_api_key
      expect(@user.api_key).not_to eql api_key
    end

    it "generates another token when one already has been taken" do
      existing_user = FactoryGirl.create(:user, api_key: "auniquetoken123")
      @user.generate_api_key
      expect(@user.api_key).not_to eql existing_user.api_key
    end
  end

  it { should be_valid }
end
