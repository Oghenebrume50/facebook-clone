class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    validates :content, presence: true  
    default_scope {order(created_at: :DESC)}
end

