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
      deck = Deck.new(deck_params)
      if deck.save
        render json: deck, status: 201, location: [:api, deck]
      else
        render json: { errors: deck.errors }, status: 422
      end
    end

    private
      def set_deck
        @deck = Deck.find(params[:id])
        head 404 and return unless @deck.present?
      end

      def deck_params
        params.require(:deck).permit(:title)
      end
  end
end
