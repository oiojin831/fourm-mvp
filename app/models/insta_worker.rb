class InstaWorker
  def initialize(user_info: )
    @user_info = user_info
    @user_id = @user_info.uid.to_i
    @token = user_info.credentials.token
  end

  def save
    parse

    store = InstaSave.store(@user_info)

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
    data = InstaParser.new(user_id: @user_id, token: @token)
    @media_info = data.parse_media
  end

end
