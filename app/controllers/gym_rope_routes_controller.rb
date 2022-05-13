class GymRopeRoutesController < ApplicationController
  def index
    @gym = Gym.find(params[:gym_id])
    @rope_routes = @gym.rope_routes
  end
end
