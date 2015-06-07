class InstaSave
  def self.store(store_info)
    store = Store.new do |s|
      s.username = store_info[:username]
      s.insta_id = store_info[:insta_id]
      s.profile_picture = store_info[:profile_picture]
    end

    store
  end

  def self.media(media_info, store)
    binding.pry
    medium = Medium.new do |m|
      m.store_id = store.id
      m.caption_text = media_info[:caption_text]
      m.low_resolution = media_info[:low_resolution]
      m.thumbnail = media_info[:thumbnail]
      m.standard_resolution = media_info[:standard_resolution]
    end

    medium
  end
end
