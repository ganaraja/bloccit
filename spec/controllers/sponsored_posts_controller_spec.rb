require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sp) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price) }

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sp.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sp.id
      expect(response).to render_template :show
    end

    it "assigns my_sp to @sponsored_post" do
      get :show, topic_id: my_topic.id, id: my_sp.id
      expect(assigns(:sponsored_post)).to eq(my_sp)
    end
  end

  describe "GET #new" do

    it "returns http success" do
       get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
       get :new, topic_id: my_topic.id
       expect(response).to render_template :new
    end

    it "instantiates @sponsored_post" do
       get :new, topic_id: my_topic.id
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_sp.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_sp.id
      expect(response).to render_template :edit
    end

    it "assigns sponsored_post to be updated to @sponsored_post" do
      get :edit, topic_id: my_topic.id, id: my_sp.id

      sponsored_post_instance = assigns(:sponsored_post)

      expect(sponsored_post_instance.id).to eq my_sp.id
      expect(sponsored_post_instance.title).to eq my_sp.title
      expect(sponsored_post_instance.body).to eq my_sp.body
    end
  end

end
