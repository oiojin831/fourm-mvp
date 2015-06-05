class InstaWorker
  def initialize(username: )
    @username = username
  end

  def save
    parse

    store = Store.new do |s|
      s.username = @store_info[:username]
      s.insta_id = @store_info[:insta_id]
      s.profile_picture = @store_info[:profile_picture]
    end

    if store.save
      medium = Medium.new do |m|
        m.store_id = store.id
        m.caption_text = @media_info[:caption_text]
        m.low_resolution = @media_info[:low_resolution][:url]
        m.thumbnail = @media_info[:thumbnail][:url]
        m.standard_resolution = @media_info[:standard_resolution][:url]
      end

      @store_id = store.id
      medium.save
    else
      false
    end
  end

  def store_id
    @store_id
  end

  private

  def parse
    data = InstaParser.new(username: @username)
    @store_info = data.parse_store
    @media_info = data.parse_media[0]
  end
end
