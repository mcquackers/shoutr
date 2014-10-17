class NotificationsController < ApplicationController
  def show
    search_term = "@#{current_user.username}"
    redirect_to search_path(query: search_term)
  end
end
