class SearchesController < ApplicationController
  def index
    @instagram = Instagram.user_recent_media(user_id, count: 30)
    next_max_id = @instagram.pagination.next_max_id
    @page_2 = Instagram.user_recent_media(user_id, max_id: next_max_id, count: 30 ) unless next_max_id.nil?
  end

  private

  def user_id
    search_user[0].id
  end

  def search_user
    Instagram.user_search(params[:search], count: 1)
  end
end
