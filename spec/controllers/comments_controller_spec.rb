require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    describe "create new comment" do
        context "when comment creation succeeds" do
          it "creates comment with body" do
            user =  FactoryBot.create(:user)
            post = user.posts.create(
                content: "This is the comment"
            )
            params = {
                body: "This is the comment",
                user_id: user.id
            }
            expect { 
                post.comments.create(params)
             }.to change(Comment, :count).by(1)
          end  
        end

        context "when comment creation fails" do
            it "should not create comment without body" do
              user =  FactoryBot.create(:user)
              post = user.posts.create(
                  content: "This is the comment"
              )
              params = {
                  body: nil,
                  user_id: user.id
              }
              expect { 
                  post.comments.create(params)
               }.to_not change(Comment, :count)
            end  
          end  
      end        
end
