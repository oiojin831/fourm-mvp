class SearchesController < ApplicationController
  def index
    @store = Store.all
  end

  def create
    worker = InstaWorker.new(username: params[:search])
    if worker.save
      redirect_to searches_path
    else
      redirect_to root_path
    end

  end
end
