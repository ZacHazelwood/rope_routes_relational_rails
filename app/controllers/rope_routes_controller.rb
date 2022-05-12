class RopeRoutesController < ApplicationController
  def index
    @rope_routes = RopeRoute.all
  end

  def show

  end  
end
