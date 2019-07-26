require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, and password" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end
  it "is invalid with a duplicate email address" do
    User.create(
      name:  "Tester",
      email:      "tester@example.com",
      password:   "123456",      
    )

    user = User.new(
      name:  "Tester",
      email:      "tester@example.com",
      password:   "123456",      
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  
  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
end