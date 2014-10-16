class ImageSubjectsController < ApplicationController
  def create
    @image_subject = ImageSubject.new(image_subject_params)
    if @image_subject.save
      current_user.shouts.create(subject: @image_subject)
      redirect_to root_path
    else
      @timeline = current_user.timeline.page(params[:page]).per(5)
      @subject = @image_subject
      @image_subject = ImageSubject.new
      @text_subject = TextSubject.new
      render "shouts/index"
    end

  end

  private
  def image_subject_params
    params.require(:image_subject).permit(:url)
  end
end
