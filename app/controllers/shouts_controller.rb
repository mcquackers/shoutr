class ShoutsController < ApplicationController
  before_action :require_login
  def index
    @text_subject = TextSubject.new
    @image_subject = ImageSubject.new
    @shouts = current_user.timeline
    @subject = @text_subject
  end

end
