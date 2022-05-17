class GymRopeRoutesController < ApplicationController
  def index
    @gym = Gym.find(params[:id])
    @rope_routes = @gym.rope_routes
  end

  def new
    @gym = Gym.find(params[:id])
  end

  def create
    gym = Gym.find(params[:id])
    new_rope_route = gym.rope_routes.create(gym_rope_route_params)
    new_rope_route.save
    redirect_to "/gyms/#{gym.id}/rope_routes"
  end

  private
    def gym_rope_route_params
      params.permit(:grade, :color, :top_rope, :lead, :height)
    end
end
