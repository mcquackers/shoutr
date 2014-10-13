class ShoutsController < ApplicationController
  before_action :require_login
  def index
    @shout = Shout.new
    @shouts = Shout.all
  end

  def create
    @shout = current_user.shouts.new(shout_params)
    @shouts = Shout.all
    if @shout.save
      redirect_to shouts_path
    else
      render :index
    end
  end
  private
  def shout_params
    params.require(:shout).permit(:body)
  end
end
