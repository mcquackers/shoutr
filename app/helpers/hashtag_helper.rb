module HashtagHelper
  def hashtag(body)
    hashtag_pattern = /#\w+/
    body.gsub(hashtag_pattern) do |hashtag|
      link_to hashtag, search_path(query: hashtag[1..-1])
    end
  end
end
