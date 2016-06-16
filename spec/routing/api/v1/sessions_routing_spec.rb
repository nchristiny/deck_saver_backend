require "rails_helper"

RSpec.describe Api::V1::SessionsController, :type => :routing do
  describe 'Sessions routing' do
    it 'routes POST /api/login to sessions#create' do
      expect({post: '/login'}).to route_to(controller: 'api/v1/sessions', action: 'create', format: :json)
    end

    it 'routes DELETE /api/logout to sessions#destroy' do
      expect({delete: '/logout'}).to route_to(controller: 'api/v1/sessions', action: 'destroy', format: :json)
    end
  end
end
