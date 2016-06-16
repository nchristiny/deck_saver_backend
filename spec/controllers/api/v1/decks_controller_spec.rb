require 'rails_helper'

RSpec.describe Api::V1::DecksController, type: :controller do
  describe "GET #index" do
    random_number = 2 + rand(10)
    before(:each) do
      counter = 0
      user = FactoryGirl.create(:user)
      random_number.times do
        FactoryGirl.create(:deck, title: "test_deck#{counter}", user_id: user[:id])
        counter += 1
      end
      get :index
    end

    context 'all decks' do
      it 'returns all the decks' do
        decks = Deck.all
        expect(decks.count).to be(random_number)
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #show" do
    let(:user) { FactoryGirl.create(:user) }
    let(:deck) { FactoryGirl.create(:deck, title: "Generic but unique Title", user_id: user[:id]) }
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
  end

  describe "POST #create" do
    context "with valid attributes" do
      pending  "creates a new deck"
    end

    context "with invalid attributes" do
      pending  "does not create a new deck"
    end
  end
end
