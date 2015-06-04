class SearchesController < ApplicationController
  def index
    @store = Store.all
    @media = Medium.all
  end

  def create
    data = InstaParser.new(username: params[:search])
    store_info = data.parse_store
    media_info = data.parse_media[0]

    store = Store.new do |s|

      s.username = store_info[:username]
      s.insta_id = store_info[:insta_id]
      s.profile_picture = store_info[:profile_picture]
    end

    medium = Medium.new do |m|
      m.store_id = store.id
      m.caption_text = media_info[:caption_text]
      m.low_resolution = media_info[:low_resolution][:url]
      m.thumbnail = media_info[:thumbnail][:url]
      m.standard_resolution = media_info[:standard_resolution][:url]
    end

    if store.save && medium.save
      redirect_to searches_path
    end

  end
end
