require 'rails_helper'

RSpec.describe Api::V1::DecksController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create :user
    api_authorization_header @user.api_key
    allow(controller).to receive(:current_user).and_return(@user)
  end

  describe "GET #index" do
    random_number = 2 + rand(10)
    before(:each) do
      counter = 0
      random_number.times do
        FactoryGirl.create(:deck, title: "test_deck#{counter}")
        counter += 1
      end
      get :index
    end

    context 'all decks' do
      it 'returns all the decks' do
        decks = Deck.all
        expect(decks.count).to be(random_number)
      end

      it "returns the user object into each deck" do
        decks_response = json_response[:decks]
        decks_response.each do |deck_response|
          expect(deck_response[:user]).to be_present
        end
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #show" do
    let(:deck) { FactoryGirl.create(:deck, title: "Generic but unique Title") }
    before(:each) do
      get :show, params: { id: deck.id }
    end

    it 'responds with the correct deck in JSON format' do
      expect(json_response[:deck][:title]).to eq "Generic but unique Title"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "has the user as a embeded object" do
      deck_response = json_response[:deck]
      expect(deck_response[:user][:email]).to eql deck.user.email
    end
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @deck_attributes = FactoryGirl.attributes_for :deck
        process :create, method: :post, params: { user_id: @user.id, deck: @deck_attributes }
      end

      it "renders the json representation for the deck record just created" do
        deck_response = json_response
        expect(deck_response[:deck][:title]).to eql @deck_attributes[:title]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_deck_attributes = { bad_attribute: "bad" }
        process :create, method: :post, params: { user_id: @user.id, deck: @invalid_deck_attributes }
      end

      it "renders an errors json" do
        deck_response = json_response
        expect(deck_response).to have_key(:errors)
      end

      it "renders the json errors with a reason why the user could not be created" do
        deck_response = json_response
        expect(deck_response[:errors][:title]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @deck = FactoryGirl.create :deck, user: @user
    end

    context "when is successfully updated" do
      before(:each) do
        process :update, method: :put, params: { user_id: @user.id, id: @deck.id, deck: { title: "An expensive TV" } }
      end

      it "renders the json representation for the updated user" do
        deck_response = json_response[:deck]
        expect(deck_response[:title]).to eql "An expensive TV"
      end

      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        process :update, method: :put, params: { user_id: @user.id, id: @deck.id, deck: { title: "" } }
      end

      it "renders an errors json" do
        deck_response = json_response
        expect(deck_response).to have_key(:errors)
      end

      it "renders the json errors describing the reason the record could not be updated" do
        deck_response = json_response
        expect(deck_response[:errors][:title]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @deck = FactoryGirl.create :deck, user: @user
      process :destroy, method: :delete, params: { user_id: @user.id, id: @deck.id }
    end

    it { should respond_with 204 }
  end

end
