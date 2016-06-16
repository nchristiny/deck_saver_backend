require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users request" do
    it "receives a status 200" do
      get api_users_path
      expect(response).to have_http_status(200)
    end
  end
end
