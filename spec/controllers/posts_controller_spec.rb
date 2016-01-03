require 'rails_helper'
include RandomData

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    let(:my_post){Post.create!(title: RandomData.random_sentence,body: random_paragraph)}
    it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
    end

   it "assigns [my_post] to @posts" do
     get :index
     expect(assigns(:posts)).to eq([my_post])
   end
  end
end
