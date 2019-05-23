require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe "GET #index" do
    it "renders the sign-up page, including 3 options for the registration" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "assigns the user's information to @user" do
      user = create(:user)
      get :new, params: { id: user }
    end

    it "renders the sign-up page which contains the details of personal information" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe "POST #create" do
    context 'will be VALID for the attributes' do
      before do
        @user = FactoryBot.attributes_for(:user)
      end

      it "requests 302 status" do
        post :create, params: {user: @user }
        expect(response.status).to eq 302
      end

      it 'register a new user to the databese' do
        expect{
          post :create, params: {user: @user}
        }.to change(User, :count).by(1)
      end

      it "redirect to new_address_path" do
        post :create, params: {user: @user }
        expect(response).to redirect_to new_address_path
      end
    end

    context 'will be INVALID for the attributes' do
      before do
        @invalid = FactoryBot.attributes_for(:user, :invalid)
      end
      
      it 'requests 200 status' do
        post :create, params: {user: @invalid}
        expect(response.status).to eq 200
      end

      it 'dos NOT register a new user' do
        expect{
          post :create, params: {user: @invalid}
        }.not_to change(User, :count)
      end

      it 'redirect to :new template' do
        post :create, params: {user: @invalid}
        expect(response).to render_template :new
      end
    end
  end
end
