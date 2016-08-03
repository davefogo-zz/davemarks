require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:first_user) { create(:user, email: "first_user@gmail.com") }
  let(:second_user) { create(:user, email: "second_user@gmail.com") }
  let(:topic) { create(:topic) }
  let(:first_user_bookmark) { create(:bookmark, user: first_user, topic: topic)}
  let(:second_user_bookmark) { create(:bookmark, user: second_user, topic: topic)}

  context "user performs CRUD on a bookmark they own" do

    before :each do
      sign_in first_user
    end

    describe "GET #show" do
      it "returns http success" do
        get :show,  topic_id: topic.id, id: first_user_bookmark.id
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, topic_id: topic.id, id: first_user_bookmark.id
        expect(response).to render_template :show
      end

      it "assigns first_user_bookmark to @bookmark" do
        get :show, topic_id: topic.id, id: first_user_bookmark.id
        expect(assigns(:bookmark)).to eq(first_user_bookmark)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, topic_id: topic.id
        expect(response).to have_http_status(:success)
      end

      it "renders the new view" do
        get :new, topic_id: topic.id
        expect(response).to render_template :new
      end

      it "instantiates @bookmark" do
        get :new, topic_id: topic.id
        expect(response).not_to be_nil
      end
    end

    describe "POST #create" do
      it "increase the number of bookmark by 1" do
        expect{post :create, bookmark: {url: Faker::Internet.url, description: Faker::Hipster.sentence, topic: topic, user: first_user}}.to change(Bookmark, :count).by(1)
      end

      it "assigns the new bookmark to @bookmark" do
        post :create, bookmark: {url: Faker::Internet.url, description: Faker::Hipster.sentence, topic: topic, user: first_user}
        expect(assigns(:bookmark)).to eq Bookmark.last
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, topic_id: topic.id, id: first_user_bookmark.id
        expect(response).to have_http_status(:success)
      end

      it "renders the edit view" do
        get :edit, topic_id: topic.id, id: first_user_bookmark.id
        expect(response).to render_template :edit
      end

      it "assigns bookmark to be updated to @bookmark" do
        get :edit, topic_id: topic.id, id: first_user_bookmark.id
        expect(assigns(:bookmark)).to eq(first_user_bookmark)
      end
    end

    describe "PUT #update" do
      it "updates post with expected attributes" do
        new_url = Faker::Internet.url
        new_description = Faker::Hipster.sentence

        put :update, topic_id: topic.id, id: first_user_bookmark.id, bookmark: {url: new_url, description: new_description}

        updated_bookmark = assigns(:bookmark)
        expect(updated_bookmark.id).to eq(first_user_bookmark.id)
        expect(updated_bookmark.url).to eq(new_url)
        expect(updated_bookmark.description).to eq(new_description)
      end

      it "redirects to the updated bookmark" do
        new_url = Faker::Internet.url
        new_description = Faker::Hipster.sentence

        put :update, topic_id: topic.id, id: first_user_bookmark.id, bookmark: {url: new_url, description: new_description}
        expect(response).to redirect_to [topic, first_user_bookmark]
      end
    end

    describe "DELETE #destroy" do

      it "deletes the bookmark" do
        delete :destroy, topic_id: topic.id, id: first_user_bookmark.id
        count = Bookmark.where({id: first_user_bookmark.id}).size
        expect(count).to eq(0)
      end

      it "redirects to topics index" do
        delete :destroy, topic_id: topic.id, id: first_user_bookmark.id
        expect(response).to redirect_to(topic)
      end
    end
  end

  context "user performs CRUD on a bookmark they don't own" do

    before :each do
      sign_in second_user
    end

    describe "GET #show" do
      it "returns http success" do
        get :show,  topic_id: topic.id, id: first_user_bookmark.id
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, topic_id: topic.id, id: first_user_bookmark.id
        expect(response).to render_template :show
      end

      it "assigns first_user_bookmark to @bookmark" do
        get :show, topic_id: topic.id, id: first_user_bookmark.id
        expect(assigns(:bookmark)).to eq(first_user_bookmark)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, topic_id: topic.id
        expect(response).to have_http_status(:success)
      end

      it "renders the new view" do
        get :new, topic_id: topic.id
        expect(response).to render_template :new
      end

      it "instantiates @bookmark" do
        get :new, topic_id: topic.id
        expect(response).not_to be_nil
      end
    end

    describe "POST #create" do
      it "increase the number of bookmark by 1" do
        expect{post :create, bookmark: {url: Faker::Internet.url, description: Faker::Hipster.sentence, topic: topic, user: second_user}}.to change(Bookmark, :count).by(1)
      end

      it "assigns the new bookmark to @bookmark" do
        post :create, bookmark: {url: Faker::Internet.url, description: Faker::Hipster.sentence, topic: topic, user: second_user}
        expect(assigns(:bookmark)).to eq Bookmark.last
      end
    end

    describe "GET #edit" do
      it "returns http redirect" do
        get :edit, topic_id: topic.id, id: first_user_bookmark.id
        expect(response).to redirect_to(:topic)
      end
    end

    describe "PUT #update" do
      it "returns http redirect" do
        new_url = Faker::Internet.url
        new_description = Faker::Hipster.sentence

        put :update, topic_id: topic.id, id: first_user_bookmark.id, bookmark: {url: new_url, description: new_description}
        expect(response).to redirect_to(topic)
      end
    end

    describe "DELETE #destroy" do
      it "redirects to topics index" do
        delete :destroy, topic_id: topic.id, id: first_user_bookmark.id
        expect(response).to redirect_to(topic)
      end
    end
  end
end
