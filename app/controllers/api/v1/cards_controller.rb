module Api::V1
  class CardsController < ApiController
    before_action :set_card, only: [:show]
    def index
      render json: Card.all
    end

    def show
      render json: @card
    end

    private
      def set_card
        @card = Card.find(params[:id])
        head 404 and return unless @card.present?
      end
  end
end
