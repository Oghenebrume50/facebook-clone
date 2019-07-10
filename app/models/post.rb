class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: "User"
  has_many :comments
  has_many :likes 

end
