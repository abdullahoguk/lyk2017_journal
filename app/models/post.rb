# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  status     :integer
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class Post < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :comments
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  
  has_many :likes
  # user -- LIKES --- posts
  has_many :liked_users, through: :likes, source: :user

  validates :title, :body, :status, presence: true

  # map 0 1 2 to draft secret public
  # Allows SomePost.draft? >> true false 
  enum status: [:draft,:secret,:public]
end
