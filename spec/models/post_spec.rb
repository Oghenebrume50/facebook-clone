require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is invalid without content" do
    user = User.create(
      name:  "poster",
      email:      "poster@example.com",
      password:   "123456",      
    )
    new_post = user.posts.create(content: nil)
    expect(new_post.errors[:content]).to include("can't be blank")
  end
end
