require 'rails_helper'

class Authentication
  include Authenticable
end

describe Authenticable do
  let(:authentication) { Authentication.new }
  subject { authentication }

  describe "#current_user" do
    before do
      @user = FactoryGirl.create :user
      request.headers["Authorization"] = @user.api_key
      # Deprecated notation
      # authentication.stub(:request).and_return(request)
      allow(authentication).to receive(:current_user).and_return(@user)
    end
    it "returns the user from the authorization header" do
      expect(authentication.current_user.api_key).to eql @user.api_key
    end
  end
end
