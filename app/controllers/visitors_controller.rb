class VisitorsController < ApplicationController
  def index
    @store = Store.all
  end
end
