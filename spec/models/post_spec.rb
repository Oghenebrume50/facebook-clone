require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "create new post" do
    before(:each) do
      user = :user
      @user = User.create(
        name:  "poster",
        email:      "poster@example.com",
        password:   "123456",      
      )
    end
    context "when post creation success" do
    end

    context "when post creation fails" do
      it "is invalid without content" do
        new_post = @user.posts.create(content: nil)
        expect(new_post.errors[:content]).to include("can't be blank")
      end  
    end      
  end      
end
