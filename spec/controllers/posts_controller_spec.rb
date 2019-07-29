require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PostsController, type: :controller  do
    login_user
  
    it "should get index" do
      get :index, params: { user_id: :user}
      expect(response).to have_http_status(:success)
    end

    describe "create new post" do
      before(:each) do
      end
      context "when post creation success" do
        it "creates post with content" do
          params = {
            content: "hello this is a test post",            
          }
          expect { post(:create, params: { user_id: :user, post: params }) }.to change(Post, :count).by(1)
        end  
      end
  
      context "when post creation fails" do
        it "creates post without content" do
          params = {
            content: nil            
          }
          expect { post(:create, params: { user_id: :user, post: params }) }.to_not change(Post, :count)
        end  
      end      
    end      
  
end

