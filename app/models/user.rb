class User < ActiveRecord::Base
  has_many :shouts
  has_many :following_relationships
  has_many :followers, through: :following_relationships
  has_many :followed_users, through: :following_relationships
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
