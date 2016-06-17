module Api::V1
  class DecksController < ApiController
    before_action :set_deck, only: [:show]
    before_action :authenticate_with_token!, only: [:create, :update, :destroy]

 def index
   decks = params[:deck_ids].present? ? Deck.find(params[:deck_ids]) : Deck.all
   render json: decks
 end

  def show
    render json: @deck
  end

  def new
  end

  def create
    deck = current_user.decks.build(deck_params)
    if deck.save
      render json: deck, status: 201, location: [:api, deck]
    else
      render json: { errors: deck.errors }, status: 422
    end
  end

  def update
    deck = current_user.decks.find(params[:id])
    if deck.update(deck_params)
      render json: deck, status: 200, location: [:api, deck]
    else
      render json: { errors: deck.errors }, status: 422
    end
  end

  def destroy
    deck = current_user.decks.find(params[:id])
    deck.destroy
    head 204
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
