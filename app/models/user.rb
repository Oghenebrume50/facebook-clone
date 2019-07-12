class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, foreign_key: :author_id
         has_many :comments
         has_many :likes
     
         has_many :friendings, foreign_key: :inviting_user_id
         has_many :friendings, foreign_key: :invited_user_id
     
         has_many :invited_users, through: :friendings
         has_many :inviting_users, through: :friendings             
end
