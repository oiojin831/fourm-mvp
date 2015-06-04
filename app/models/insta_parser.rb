class InstaParser

  def initialize(username: )
    @username = username
    @store = Hash.new()
    @medias = Array.new()
  end

  def parse_medias

    for media in medias
      data = Hash.new()
      images = media.images
      data[:caption_text] = media.caption.text if media.caption
      data[:low_resolution] = images.low_resolution.url
      data[:thumbnail] = images.thumbnail.url
      data[:standard_resolution] = images.standard_resolution.url

      @medias << data
    end

    @medias
  end

  def parse_store
    @store[:username] = current_user.username
    @store[:insta_id] = current_user.id
    @store[:profile_picture] = current_user.profile_picture

    @store
  end

  private

  def medias
    Instagram.user_recent_media(user_id, count: 30)
  end

  def user_id
    current_user.id
  end

  def current_user
    Instagram.user_search(@username, count: 1)[0]
  end

end
