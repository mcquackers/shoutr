module FeedHelper
  def linkify_text_shout(body)
    sanitize bold_username(hashtag(body))
  end
end
