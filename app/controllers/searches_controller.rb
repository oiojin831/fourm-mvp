class SearchesController < ApplicationController
  def index
    @store = Store.all
  end

  def create
    data = InstaParser.new(username: params[:search])
    store_info = data.parse_store
    # medias_info = data.parse_medias
    store = Store.new do |s|
      s.username = store_info[:username]
      s.insta_id = store_info[:insta_id]
      s.profile_picture = store_info[:profile_picture]
    end

    if store.save
      redirect_to searches_path
    end
  end
end
