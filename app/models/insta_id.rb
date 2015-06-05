class InstaId

  def self.user_id(username: )
    current_user = Instagram.user_search(username, count:1)[0]
    current_user.id
  end
end
