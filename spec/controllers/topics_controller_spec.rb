require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:user) {create(:user)}

  describe "GET #index" do

    it "returns http success" do
      sign_in :user,  @user
      sign_in @user

      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns Topic.all to topics" do
      get :index
      expect(assigns(:topics)).to eq(Topic.all)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
