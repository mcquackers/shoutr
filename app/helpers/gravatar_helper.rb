module GravatarHelper
  def show_gravatar(email)
    email_hash = Digest::MD5.hexdigest(email)
    grav_url = "http://www.gravatar.com/avatar/#{email_hash}"
    image_tag(grav_url, class: "gravatar")
  end
end
