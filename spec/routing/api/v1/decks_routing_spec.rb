require "rails_helper"

RSpec.describe Api::V1::DecksController, :type => :routing do
  describe 'Decks routing' do

    it 'routes to #index' do
      expect(:get => '/decks').to route_to(controller: 'api/v1/decks', action: 'index', format: :json)
    end

    it 'routes to #new' do
      expect(:get => '/decks/new').to route_to(controller: 'api/v1/decks', action: 'new', format: :json)
    end

    it 'routes to #show' do
      expect(:get => '/decks/1').to route_to(controller: 'api/v1/decks', action: 'show', id: '1', format: :json)
    end

    describe "nested user routes" do
      before(:each) do
        @deck = FactoryGirl.create(:deck)
      end

      it 'routes to #create' do
        expect(post: "/users/#{@deck.user_id}/decks").to route_to(controller: "api/v1/decks", action: 'create', user_id: @deck.user_id.to_s, format: :json)
      end

      it 'routes to #update' do
        expect(:put => "/users/#{@deck.user_id}/decks/#{@deck.id}" ).to route_to(controller: 'api/v1/decks', action: 'update', id: @deck.id.to_s, user_id: @deck.user_id.to_s, format: :json)
      end

      it 'routes to #destroy' do
        expect(:delete => "/users/#{@deck.user_id}/decks/#{@deck.id}").to route_to(controller: 'api/v1/decks', action: 'destroy', id: @deck.id.to_s, user_id: @deck.user_id.to_s, format: :json)
      end
    end
  end
end
