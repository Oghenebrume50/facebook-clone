class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, foreign_key: :author_id, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :likes, dependent: :destroy
     
         has_many :friendings, foreign_key: :inviting_user_id, dependent: :destroy
         has_many :friendings, foreign_key: :invited_user_id, dependent: :destroy
     
         has_many :invited_users, through: :friendings, dependent: :destroy
         has_many :inviting_users, through: :friendings, dependent: :destroy        
end
