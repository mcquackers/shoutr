class FollowingRelationship < ActiveRecord::Base
  belongs_to :followed_user, class_name: "User"
  belongs_to :follower, class_name: "User"

  validate :user_cannot_follow_self

  private
  def user_cannot_follow_self
    if follower_id == followed_user_id
      errors.add(:base, "Users cannot follow themselves")
    end
  end
end
