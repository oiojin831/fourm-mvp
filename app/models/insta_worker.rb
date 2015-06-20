class InstaWorker
  def initialize(user_info:, media_info:)
    @user_info = user_info
    @media_info = media_info
  end

  def save
    parse

    store = InstaSave.store(@user_info)

    if store.save
      @store_id = store.id

      InstaSave.media_and_tag(@parse_media_info, store)
    else
      false
    end
  end

  def store_id
    @store_id
  end

  private

  def parse
    data = InstaParser.new(user_info: @user_info, media_info: @media_info)
    @parse_media_info = data.parse_media
  end

end
