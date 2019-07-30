require 'rails_helper'

RSpec.describe LikesController, type: :controller do
    describe "Like post" do
        context "when post like succeeds" do
          it "should increase likes on post" do
            user =  FactoryBot.create(:user)
            post = user.posts.create(
                content: "This is the comment"
            )
            params = {
                user_id: user.id
            }
            expect { 
                post.likes.create(params)
             }.to change(Like, :count).by(1)
          end  
        end
    end
end
