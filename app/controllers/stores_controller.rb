class StoresController < ApplicationController
  def show
    @media = Store.find(params[:id]).media
  end
end
