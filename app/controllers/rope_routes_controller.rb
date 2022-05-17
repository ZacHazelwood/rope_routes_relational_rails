class RopeRoutesController < ApplicationController
  def index
    @rope_routes = RopeRoute.all
  end

  def show
    @rope_route = RopeRoute.find(params[:id])
  end

  def edit
    @rope_route = RopeRoute.find(params[:id])
  end

  def update
    update_route = RopeRoute.find(params[:id])
    update_route.update(rope_route_params)
    update_route.save
    redirect_to "/rope_routes/#{params[:id]}"
  end

  private
    def rope_route_params
      params.permit(:grade, :color, :top_rope, :lead, :height)
    end  
end
