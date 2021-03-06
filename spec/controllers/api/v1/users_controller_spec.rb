require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create :user
    api_authorization_header @user.api_key
  end

  describe "GET #index" do
    number_of_users = 2 + rand(10)
    before(:each) do
      number_of_users.times do
        FactoryGirl.create(:user)
      end
      get :index
    end

    context 'all users' do
      it 'returns all the users' do
        users = User.all
        expect(users.count).to be (number_of_users + 1)
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      describe 'Total number of users' do
        subject { assigns(:users) }
        it "should be #{number_of_users + 1}" do
          expect(User.all.size).to eq (number_of_users + 1)
        end
      end
    end
  end

  describe "GET #show" do
    context "when is successfully found" do
      before(:each) do
        get :show, params: { id: @user.id }
      end

      it "returns the information about a user" do
        user_response = json_response[:user]
        expect(user_response[:email]).to eql @user.email
      end

      it "has the deck ids as an embeded object" do
        user_response = json_response[:user]
        expect(user_response[:deck_ids]).to eql []
      end

      it { should respond_with 200 }
    end
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        process :create, method: :post, params: { user: @user_attributes }
      end

      it "renders the json representation for the user record just created" do
        user_response = json_response[:user]
        expect(user_response[:email]).to eql @user_attributes[:email]
      end
      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_user_attributes = { bad_attribute: "No" }
        process :create, method: :post, params: { user: @invalid_user_attributes }
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on why the user could not be created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "can't be blank"
      end
      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    context "when is successfully updated" do
      before(:each) do
        process :update, method: :post, params: { id: @user.id, user: { email: "newmail@example.com" } }
      end

      it "renders the json representation for the updated user" do
        user_response = json_response[:user]
        expect(user_response[:email]).to eql "newmail@example.com"
      end
      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        process :update, method: :post, params: { id: @user.id, user: { email: '' } }
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors when user could not be created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "can't be blank"
      end
      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      process :destroy, method: :delete, params: { id: @user.id }
    end
    it { should respond_with 204 }
  end
end
