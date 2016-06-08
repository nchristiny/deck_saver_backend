require 'rails_helper'

RSpec.describe Api::V1::CardsController, type: :controller do
    describe "GET #index" do
      random_number = rand(31)
      before(:each) do
        counter = 0
        user = FactoryGirl.create(:user)
        deck = FactoryGirl.create(:deck, user_id: user[:id])
        random_number.times do
          card = FactoryGirl.create(:card, cardId: "test_card#{counter}", deck_id: deck[:id])
          counter += 1
        end
      get :index
    end

    context 'all cards' do
      it 'returns all the cards' do
        cards = Card.all
        expect(cards.count).to be(random_number)
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
    let(:card) { FactoryGirl.create(:card, cardId: "Equally generic but unique cardId", deck_id: deck[:id]) }
    before(:each) do
      get :show, params: { id: card.id }
    end

    it 'responds with the correct deck in JSON format' do
      expect(json_response[:card][:cardId]).to eq "Equally generic but unique cardId"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
