require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
    describe "Friendships" do
        context "when friend request sends" do
          it "should increase friendships by one" do
            user =  FactoryBot.create(:user)
            friend = User.create(
                name:  "Tester",
                email:      "tester@example.com",
                password:   "123456",      
              )
            params = {
                user_id: user.id,
                friend_id: friend.id,
                confirmed: false
            }
            expect { 
                user.friendships.create(params)
             }.to change(Friendship, :count).by(1)
          end  
        end

        context "when friend request is accepted" do
            it "should increase friends by one" do
              user =  FactoryBot.create(:user)
              friend = User.create(
                  name:  "Tester",
                  email:      "tester@example.com",
                  password:   "123456",      
                )
              params = {
                  user_id: user.id,
                  friend_id: friend.id,
                  confirmed: false
              }
              user.friendships.create(params)
              before_accept = user.friends.size
              user.friendships.update(confirmed: true)
              after_accept = user.friends.size
              expect(before_accept).to_not eq(after_accept)
            end  
          end
    end
end
