class InstaSave
  def self.store(store_info)
    store = Store.new do |s|
      s.username = store_info[:username]
      s.insta_id = store_info[:insta_id]
      s.profile_picture = store_info[:profile_picture]
    end

    store
  end

  def self.media_and_tag(media_info, store)
    media_info.inject([]) do |media, medium|
      new_medium(medium, store)
    end

  end

  private

  def self.new_medium(medium_info, store)
    medium = Medium.create do |m|
      m.store_id = store.id
      m.caption_text = medium_info[:caption_text]
      m.low_resolution = medium_info[:low_resolution]
      m.thumbnail = medium_info[:thumbnail]
      m.standard_resolution = medium_info[:standard_resolution]
    end
    new_tag(medium_info, medium)
  end

  def self.new_tag(caption_info, medium)
    tag = Tag.create do |t|
      t.medium_id = medium.id
      t.price = caption_info[:price]
      t.category = caption_info[:category]
      t.name = caption_info[:name]
    end

    tag
  end
end
