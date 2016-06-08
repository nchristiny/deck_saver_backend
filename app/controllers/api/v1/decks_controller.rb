module Api::V1
  class DecksController < ApiController
    before_action :set_deck, only: [:show]

    def index
      render json: Deck.all
    end

    def show
      render json: @deck
    end

    def create
    end

    private
      def set_deck
        @deck = Deck.find(params[:id])
        head 404 and return unless @deck.present?
      end
  end
end
