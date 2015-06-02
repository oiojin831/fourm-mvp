class SearchesController < ApplicationController
  def index
    @store = Store.first
  end

  def create
    data = InstaParser.new(username: params[:search])
    store_info = data.parse_store
    Store.create(username: store_info[:username], insta_id: store_info[:insta_id], profile_picture: store_info[:profile_picture])

    redirect_to searches_path
  end
  private

  def user_id
    search_user[0].id
  end

  def search_user
    Instagram.user_search(params[:search], count: 1)
  end
end
