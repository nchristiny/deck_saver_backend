require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe "POST #create" do
    before(:each) do
      @user = FactoryGirl.create :user, password: "12345678"
    end

    context "when the credentials are correct" do
      before(:each) do
        credentials = { name: @user.name, email: @user.email, password: "12345678" }
        process :create, method: :post, params: { session: credentials }
      end

      it "returns the user record corresponding to the given credentials" do
        @user.reload
        expect(json_response[:user][:email]).to eql @user.email
      end

      it { should respond_with 201 }
    end

    context "when the credentials are incorrect" do
      before(:each) do
        credentials = { email: @user.email, password: "invalidpassword" }
        process :create, method: :post, params: { session: credentials }
      end

      it "returns a json with an error" do
        expect(json_response[:errors]).to eql "Invalid email or password"
      end

      it { should respond_with 401 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = FactoryGirl.create :user
    end

    it "should log the user out of session" do
      log_in(@user)
      log_out
      expect(session[:user_id]).to be(nil)
    end
  end
end
