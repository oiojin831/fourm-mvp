class InstaWorker
  def initialize(user_id: )
    @user_id = user_id
  end

  def save
    parse

    store = InstaSave.store(@store_info)

    if store.save
      @store_id = store.id

      InstaSave.media_and_tag(@media_info, store)
    else
      false
    end
  end

  def store_id
    @store_id
  end

  private

  def parse
    data = InstaParser.new(user_id: @user_id)
    @store_info = data.parse_store
    @media_info = data.parse_media
  end

end
