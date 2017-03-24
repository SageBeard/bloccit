require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsored_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number) }

  describe "GET show" do
      it "returns http success" do
        get :show, topic_id: my_topic.id, id: my_sponsored_post.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, topic_id: my_topic.id, id: my_sponsored_post.id
        expect(response).to render_template :show
      end

      it "assigns my_sponsored_post to @sponsored_post" do
        get :show, topic_id: my_topic.id, id: my_sponsored_post.id
        expect(assigns(:sponsored_post)).to eq(my_post)
      end
    end

    describe "SPONSORED POST create" do
    # #4
      it "increases the number of Sponsored_Posts by 1" do
        expect{post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
      end

    # #5
      it "assigns the new sponsored post to @sponsored_post" do
        post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(assigns(:post)).to eq Post.last
      end

    # #6
      it "redirects to the new post" do
        post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(response).to redirect_to [my_topic, Post.last]
      end
    end


    describe "GET edit" do
      it "returns http success" do
        get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
        expect(response).to render_template :edit
      end

      it "assigns post to be updated to @sponsoredpost" do
        get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
        sponsoredpost_instance = assigns(:sponsoredpost)

        expect(sponsoredpost_instance.id).to eq my_sponsoredpost.id
        expect(sponsoredpost_instance.title).to eq my_sponsoredpost.title
        expect(sponsoredpost_instance.body).to eq my_sponsoredpost.body
        expect(sponsoredpost_instance.price).to eq my_sponsoredpost.price
      end
    end
end
