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
    media_info.inject([]) do |media, medium|
      media << new_medium(medium, store).save
    end

  end

  private

  def self.new_medium(medium, store)
    medium = Medium.new do |m|
      m.store_id = store.id
      m.caption_text = medium[:caption_text]
      m.low_resolution = medium[:low_resolution]
      m.thumbnail = medium[:thumbnail]
      m.standard_resolution = medium[:standard_resolution]
    end

    medium
  end
end
