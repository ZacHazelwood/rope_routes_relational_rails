class RopeRoutesController < ApplicationController
  def index
    @rope_routes = RopeRoute.all
  end

  def show
    @rope_route = RopeRoute.find(params[:id])
  end
end
