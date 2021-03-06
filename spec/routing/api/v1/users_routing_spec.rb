require "rails_helper"

RSpec.describe Api::V1::UsersController, :type => :routing do
  describe 'Users routing' do

    it 'routes to #index' do
      expect(:get => '/users').to route_to(controller: 'api/v1/users', action: 'index', format: :json)
    end

    it 'routes to #new' do
      expect(:get => '/users/new').to route_to(controller: 'api/v1/users', action: 'new', format: :json)
    end

    it 'routes to #show' do
      expect(:get => '/users/1').to route_to(controller: 'api/v1/users', action: 'show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(:post => '/users').to route_to(controller: 'api/v1/users', action: 'create', format: :json)
    end

    it 'routes to #update' do
      expect(:put => '/users/1').to route_to(controller: 'api/v1/users', action: 'update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(:delete => '/users/1').to route_to(controller: 'api/v1/users', action: 'destroy', id: '1', format: :json)
    end

  end
end
