module BoldUsernameHelper
  def bold_username(body)
    username_pattern = /@[\w.]+/
    body.gsub(username_pattern) do |username|
      user = load_user(username)
      if user.present?
        link_to username, user
      else
        username
      end
    end
  end

  private

  def clean_name(match)
    match.delete('@').downcase
  end

  def load_user(username)
    User.where("username ILIKE '#{username[1..-1]}'").first
  end


end
