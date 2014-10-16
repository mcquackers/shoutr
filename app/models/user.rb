class User < ActiveRecord::Base
  has_many :shouts, dependent: :destroy
  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship"
  has_many :followed_users, through: :followed_user_relationships
  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship"
  has_many :followers, through: :follower_relationships
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def follow(user_to_follow)
    followed_users << user_to_follow
  end

  def timeline
    timeline_user_ids = followed_user_ids + [id]
    Shout.where(user_id: timeline_user_ids).order(created_at: :desc).limit(20)
  end

  def unfollow(user_to_unfollow)
    followed_users.destroy(user_to_unfollow)
  end

  def following?(other_user)
    followed_user_ids.include?(other_user.id)
  end
end
