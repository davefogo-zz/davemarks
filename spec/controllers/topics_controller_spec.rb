require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:user) { create(:user, email: "test@test.com") }
  let(:my_topic) { create(:topic, user: user) }

  before :each do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assign Topic.all to topics" do
      get :index
      expect(assigns(:topics)).to eq(Topic.all)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: my_topic.id
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
      get :edit, id: my_topic.id
      expect(response).to have_http_status(:success)
    end
  end
end
