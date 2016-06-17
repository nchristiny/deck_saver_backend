require 'rails_helper'

RSpec.describe Api::V1::CardsController, type: :controller do
    describe "GET #index" do
      random_number = rand(31)
      before(:each) do
        counter = 0
        random_number.times do
          card = FactoryGirl.create(:card, cardId: "#{counter}_cardId")
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
    let(:card) { FactoryGirl.create(:card, cardId: "Generic but unique cardId") }
    before(:each) do
      get :show, params: { id: card.id }
    end

    it 'responds with the correct deck in JSON format' do
      expect(json_response[:card][:cardId]).to eq "Generic but unique cardId"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
