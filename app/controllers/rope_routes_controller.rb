class RopeRoutesController < ApplicationController
  def index
    @rope_routes = RopeRoute.all
  end
end
