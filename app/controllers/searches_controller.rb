class SearchesController < ApplicationController
  def show
    query = params[:query]
    user_search = User.where("username ILIKE ?", "%#{query}%")
    text_search = TextSubject.where("body ILIKE ?", "%#{query}%").map do |subject|
      subject.shout
    end
    image_search = ImageSubject.where("url ILIKE ?", "%#{query}%").map do |subject|
      subject.shout
    end
    @search_results = Kaminari.paginate_array(user_search + text_search + image_search).page(params[:page]).per(3)
  end
end
