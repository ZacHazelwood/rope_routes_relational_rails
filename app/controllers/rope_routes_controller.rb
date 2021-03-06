class RopeRoutesController < ApplicationController
  def index
    # @rope_routes = RopeRoute.all
    @rope_routes = RopeRoute.has_top_rope
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

  def destroy
    RopeRoute.destroy(params[:id])
    redirect_to "/rope_routes"
  end

  private
    def rope_route_params
      params.permit(:grade, :color, :top_rope, :lead, :height)
    end
end
