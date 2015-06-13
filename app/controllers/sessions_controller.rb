class SessionsController < ApplicationController
  def create
    session[:access_token] = request.env['omniauth.auth'].credentials.token
    worker = InstaWorker.new(user_info: request.env['omniauth.auth'])
    if worker.save
      redirect_to store_path(worker.store_id)
    else
      redirect_to store_path(Store.find_by(username: params[:search]))
    end
  end
end
