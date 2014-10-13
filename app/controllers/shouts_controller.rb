class ShoutsController < ApplicationController
  before_action :require_login
  def index
    @shout = Shout.new
    @shouts = Shout.all
  end

  def create
    @shout = Shout.new(shout_params)
    @shout.user_id = current_user.id
    @shout.save
    redirect_to shouts_path
  end
  private
  def shout_params
    params.require(:shout).permit(:user_id, :body)
  end
end
