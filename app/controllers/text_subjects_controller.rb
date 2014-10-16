class TextSubjectsController < ApplicationController
  def create
    @text_subject = TextSubject.new(text_subject_params)
    if @text_subject.save
      current_user.shouts.create(subject: @text_subject)
      redirect_to root_path
    else
      @timeline = current_user.timeline.page(params[:page]).per(5)
      @subject = @text_subject
      @image_subject = ImageSubject.new
      render "shouts/index"
    end
  end

  private
  def text_subject_params
    params.require(:text_subject).permit(:body)
  end
end
