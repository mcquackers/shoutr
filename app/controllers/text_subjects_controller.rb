class TextSubjectsController < ApplicationController
  def create
    @text_subject = TextSubject.new(text_subject_params)
    if @text_subject.save
      current_user.shouts.create(subject: @text_subject)
      redirect_to root_path
    else
      @shouts = current_user.timeline
      @subject = @text_subject
      render "shouts/index"
    end
  end

  private
  def text_subject_params
    params.require(:text_subject).permit(:body)
  end
end
