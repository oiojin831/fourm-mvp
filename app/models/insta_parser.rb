class InstaParser

  def initialize(user_id: )
    @user_id = user_id
  end

  def parse_store
    store = current_user.to_hash.symbolize_keys.except(:full_name)
    store[:insta_id] = store.delete :id
    store
  end

  def parse_media
    media.inject([]) do |media, medium|
      media << parse_images(medium).merge(parse_caption(medium))
    end
  end

  private

  def parse_caption(medium)
    caption = {}
    if medium.caption
      caption[:caption_text] = medium.caption.text
      caption.merge!(parse_tag(caption[:caption_text]))
    end
    caption
  end

  def parse_tag(caption)
    { price: caption.scan(/\$\d+\.*\d*/)[0], category: caption.scan(/##\S*/)[0], name: caption.scan(/\#!\S*/)[0] }
  end

  def parse_images(medium)
    data = medium.to_hash.slice("images")["images"].deep_symbolize_keys
    data.transform_values { |x| x[:url] }
  end

  def media
    Instagram.user_recent_media(user_id, count: 30)
  end

  def user_id
    @user_id
  end

  def current_user
    Instagram.user(user_id)
  end

end
