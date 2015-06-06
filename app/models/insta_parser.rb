class InstaParser

  def initialize(user_id: )
    @user_id = user_id
    @media = Array.new()
  end

  def parse_media
    parse_images
    parse_caption
  end

  def parse_caption
    index = 0
    media.each do |medium|
      @media[index][:caption_text] = medium.caption.text if medium.caption
      index += 1
    end

    @media
  end

  def parse_images
    new_data = {}
    media.each do |medium|
      data = medium.to_hash.slice("images").deep_symbolize_keys
      new_data[:low_resolution] = data[:images][:low_resolution][:url]
      new_data[:thumbnail] = data[:images][:thumbnail][:url]
      new_data[:standard_resolution] = data[:images][:standard_resolution][:url]
      @media << new_data
    end

    @media
  end

  def parse_store
    @store = current_user.to_hash.symbolize_keys.except(:full_name)
    @store[:insta_id] = @store.delete :id
    @store
  end

  private

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
