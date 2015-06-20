class SessionsController < ApplicationController
#  def create
#    session[:access_token] = request.env['omniauth.auth'].credentials.token
#    worker = InstaWorker.new(user_info: request.env['omniauth.auth'])
#    if worker.save
#      redirect_to store_path(worker.store_id)
#    else
#      redirect_to store_path(Store.find_by(username: params[:search]))
#    end
#  end

  def connect
    puts "trying to connect to instagram"
    redirect_to Instagram.authorize_url(redirect_uri: CALLBACK_URL)
  end

  def disconnect
    # logout
    session[:access_token] = nil
    redirect_to root_path
  end

  def callback
    # if the user denied authorization
    if params[:error]
      # do something
      redirect_to root_path
    else
      # get response
      response = Instagram.get_access_token(params[:code], redirect_uri: CALLBACK_URL)
      user_info = response.user
      session[:access_token] = response.access_token
      media_info = Instagram.client(access_token: session[:access_token]).user_recent_media
      # create store
      worker = InstaWorker.new(user_info: user_info, media_info: media_info)

      if worker.save
        redirect_to store_path(worker.store_id)
      else
        redirect_to store_path(Store.find_by(insta_id: user_info.id))
      end
    end
  end
end
