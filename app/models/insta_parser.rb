class InstaParser

  def initialize(user_info:, media_info:)
    @user_info = user_info
    @media_info = media_info
  end

  def parse_store
    #store = current_user.to_hash.symbolize_keys.except(:full_name)
    store = @user_info.symbolize_keys.except(:full_name)
    store[:insta_id] = store.delete :id
    store
  end

  def parse_media
    @media_info.inject([]) do |media, medium|
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
    { price: caption.scan(/\$\d+\.*\d*/)[0].to_s.gsub!(/\$/, ''), category: caption.scan(/##\S*/)[0].to_s.encode('utf-8', 'utf-8').scan(/[[:alnum:]]+/)[0], name: caption.scan(/\!#\S*/)[0].to_s.encode('utf-8', 'utf-8').scan(/[[:alnum:]]+/)[0] }
  end

  def parse_images(medium)
    data = medium.to_hash.slice("images")["images"].deep_symbolize_keys
    data.transform_values { |x| x[:url] }
  end

end

