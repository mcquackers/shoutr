class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @users = User.all
    @following_relationship = FollowingRelationship.new
  end

  def show
    @user = User.find_by_username(params[:username])
    @followed_users = @user.followed_users
    @followers = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:username,:email, :password)
  end
end

