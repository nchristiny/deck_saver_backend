require 'rails_helper'

RSpec.describe "Users", :type => :request do
  describe "GET /users" do
    it "receive status 200 on all users request" do
      get api_users_path
      expect(response).to have_http_status(200)
    end
  end
end
