require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
  before(:each) { request.headers['Accept'] = "application/vnd.deck_saver_backend.v1" }
  # let(:user) { FactoryGirl.create(:user) }
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  # let(:valid_attributes) { FactoryGirl.attributes_for(:user) }
  # let(:invalid_attributes) {
  #   { name: "", email: "invalid_email-example,net" }
  # }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  # let(:valid_session) { {} }

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
        expect(users.count).to be number_of_users
      end

      it 'responds successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      describe 'Total number of users' do
        subject { assigns(:users) }
        it "should be #{number_of_users}" do
          expect(User.all.size).to eq number_of_users
        end
      end
    end
  end

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, params: { id: @user.id }, format: :json
    end

    context "when is successfully found"
      it "returns the information about a user" do
        user_response = json_response
        expect(user_response[:user][:email]).to eql @user.email
      end

      it { should respond_with 200 }

    end

    describe "POST #create" do

      context "when is successfully created" do
        before(:each) do
          @user_attributes = FactoryGirl.attributes_for :user
          process :create, method: :post, params: { user: @user_attributes }, format: :json
        end

        it "renders the json representation for the user record just created" do
          user_response = json_response
          expect(user_response[:user][:email]).to eql @user_attributes[:email]
        end

        it { should respond_with 201 }
      end

      context "when is not created" do
        before(:each) do
          @invalid_user_attributes = { bad_attribute: "No" }
          process :create, method: :post, params: { user: @invalid_user_attributes }, format: :json
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
          @user = FactoryGirl.create :user
          process :update, method: :post, params: { id: @user.id, user: { email: "newmail@example.com" } }, format: :json
         end

         it "renders the json representation for the updated user" do
          user_response = json_response
          expect(user_response[:user][:email]).to eql "newmail@example.com"
        end

        it { should respond_with 200 }
      end

      context "when is not updated" do
        before(:each) do
          @user = FactoryGirl.create :user
          process :update, method: :post, params: { id: @user.id, user: { email: '' } }, format: :json
         end

         it "renders an errors json" do
          user_response = json_response
          expect(user_response).to have_key(:errors)
        end

        it "renders the json errors when user could not be created" do
          user_response = JSON.parse(response.body, symbolize_names: true)
          expect(user_response[:errors][:email]).to include "can't be blank"
        end

        it { should respond_with 422 }
      end
    end

    describe "DELETE #destroy" do
      before(:each) do
        @user = FactoryGirl.create :user
        process :destroy, method: :delete, params: { id: @user.id }, format: :json
      end

      it { should respond_with 204 }

    end

    #   p "#{:user}"
    #   user = User.create! valid_attributes
    #   get :index, {}, valid_session
    #   expect(assigns(:users)).to eq([:user])
    #

  # describe "GET new" do
  #   it "assigns a new user as @user" do
  #     get :new, {}, valid_session
  #     expect(assigns(:user)).to be_a_new(User)
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested user as @user" do
  #     user = User.create! valid_attributes
  #     get :edit, {:id => user.to_param}, valid_session
  #     expect(assigns(:user)).to eq(user)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new User" do
  #       expect {
  #         post :create, {:user => valid_attributes}, valid_session
  #       }.to change(User, :count).by(1)
  #     end

  #     it "assigns a newly created user as @user" do
  #       post :create, {:user => valid_attributes}, valid_session
  #       expect(assigns(:user)).to be_a(User)
  #       expect(assigns(:user)).to be_persisted
  #     end

  #     it "redirects to the created user" do
  #       post :create, {:user => valid_attributes}, valid_session
  #       expect(response).to redirect_to(User.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved user as @user" do
  #       post :create, {:user => invalid_attributes}, valid_session
  #       expect(assigns(:user)).to be_a_new(User)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:user => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested user" do
  #       user = User.create! valid_attributes
  #       put :update, {:id => user.to_param, :user => new_attributes}, valid_session
  #       user.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested user as @user" do
  #       user = User.create! valid_attributes
  #       put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
  #       expect(assigns(:user)).to eq(user)
  #     end

  #     it "redirects to the user" do
  #       user = User.create! valid_attributes
  #       put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
  #       expect(response).to redirect_to(user)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the user as @user" do
  #       user = User.create! valid_attributes
  #       put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
  #       expect(assigns(:user)).to eq(user)
  #     end

  #     it "re-renders the 'edit' template" do
  #       user = User.create! valid_attributes
  #       put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested user" do
  #     user = User.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => user.to_param}, valid_session
  #     }.to change(User, :count).by(-1)
  #   end

end
