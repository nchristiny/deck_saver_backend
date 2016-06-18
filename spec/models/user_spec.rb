require 'rails_helper'

RSpec.describe User, :type => :model do
  before(:each) do
    @user = FactoryGirl.build(:user)
  end
  subject { @user }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should_not allow_value('invalidemail@example,net').for(:email) }

  it { should respond_to(:api_key) }
  it { should validate_uniqueness_of(:api_key)}
  it { should have_many(:decks) }

  describe "#generate_api_key" do
    it "generates a token" do
      allow(@user).to receive(:api_key).and_return("auniquetoken123")
      @user.generate_api_key
      expect(@user.api_key).to eql "auniquetoken123"
    end

    it "regenerates a new token" do
      original_api_key = @user.api_key
      @user.regenerate_api_key
      expect(@user.api_key).not_to eql original_api_key
    end

    it "generates another token when one already has been taken" do
      existing_user = FactoryGirl.create(:user, api_key: "auniquetoken123")
      @user.generate_api_key
      expect(@user.api_key).not_to eql existing_user.api_key
    end
  end

  describe "#decks association" do
    before do
      @user.save
      3.times { FactoryGirl.create :deck, user: @user }
    end

    it "destroys the associated decks on self destruct" do
      decks = @user.decks
      @user.destroy
      decks.each do |deck|
        expect(Deck.find(deck)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  it { should be_valid }
end
