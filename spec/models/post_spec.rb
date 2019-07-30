require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create(
      name:  "poster",
      email:      "poster@example.com",
      password:   "123456",      
    )
  end
  it "is invalid without content" do
    new_post = @user.posts.create(content: nil)
    expect(new_post.errors[:content]).to include("can't be blank")
  end

  it "is valid with content" do
    expect {@user.posts.create(content: "I am pssing in content") }.to change(Post, :count).by(1)
  end
end
