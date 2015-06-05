class SearchesController < ApplicationController
  def index
    @store = Store.all
  end

  def create
    worker = InstaWorker.new(username: params[:search])
    if worker.save
      redirect_to store_path(worker.store_id)
    else
      redirect_to store_path(Store.find_by(username: params[:search]))
    end

  end
end
