class ReshoutSubjectsController < ApplicationController
  def create
    shout_id = params[:shout_id]
    reshout_subject = ReshoutSubject.create(shout_id: shout_id)
    current_user.shouts.create(subject: reshout_subject)

    redirect_to root_path
  end
end
