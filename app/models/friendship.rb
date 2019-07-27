class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def self.check_friend(args)
    return Friendship.where(['user_id = ? and friend_id = ?', args[:current_user_id], args[:user_id]]).length == 0 && 
    Friendship.where(['user_id = ? and friend_id = ?', args[:user_id], args[:current_user_id]]).length == 0
  end

  # Users who have yet to confirme friend requests
  def pending_friends
    friendships.map{|friendship| friendship.friend if !friendship.confirmed}.compact
  end

  def friend?(user)
    friends.include?(user)
  end
end
