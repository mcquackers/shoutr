class ShoutsController < ApplicationController
  before_action :require_login
  def index
    @text_subject = TextSubject.new
    @shouts = current_user.timeline
  end

end
