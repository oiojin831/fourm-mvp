class SearchesController < ApplicationController
  def index
    @store = Store.all
  end

  def create
    worker = InstaWorker.new(user_id: user_id)
    if worker.save
      redirect_to store_path(worker.store_id)
    else
      redirect_to store_path(Store.find_by(username: params[:search]))
    end

  end

  private

  def user_id
    InstaId.user_id(username: params[:search])
  end
end
