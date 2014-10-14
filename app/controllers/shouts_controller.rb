class ShoutsController < ApplicationController
  before_action :require_login
  def index
    @shout = Shout.new
    @following_relationship = FollowingRelationship.new
    @users_i_follow = current_user.followed_users
    @users_i_do_not_follow = User.where.not(id: current_user.followed_user_ids).where.not(id: current_user.id)
    @shouts = current_user.timeline
  end

  def create
    @users = User.all
    @shout = current_user.shouts.new(shout_params)
    @shouts = Shout.all
    if @shout.save
      redirect_to shouts_path
    else
      @users_i_follow = current_user.followed_users
      @users_i_do_not_follow = User.where.not(id: current_user.followed_user_ids).where.not(id: current_user_id)
      render :index
    end
  end
  private
  def shout_params
    params.require(:shout).permit(:body)
  end
end
