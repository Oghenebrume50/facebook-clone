require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PostsController, type: :controller  do
    login_user
  
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
  
    it "should get index" do
      get :index, params: { user_id: :user}
      expect(response).to have_http_status(:success)
    end

    describe "create new post" do
      before(:each) do
        @user = FactoryGirl.create(:user)
      end
      # context "when post creation success" do
      #   it "creates post" do
      #     post :create, user_id: :user, post: { content: "Dummy name", user_id: :user}
      #     expect(response).to redirect_to(:user)
      #   end  
      # end

      # context "when post creation fails" do
      #   it "creates post" do
      #     post :create, user_id: :user, post: { content: "Dummy name", user_id: :user}
      #     expect(response).to redirect_to(:user)
      #   end  
      # end      
    end    
end

