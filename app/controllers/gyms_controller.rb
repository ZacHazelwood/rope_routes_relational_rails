class GymsController < ApplicationController
  def index
    @gyms = Gym.all
    @gyms = Gym.order_by_creation
  end

  def show
    # @gym = Gym.find_by(id: params[:id])
    @gym = Gym.find(params[:id])
  end

  def new
  end

  def create
    # require "pry"; binding.pry
    new_gym = Gym.create(gym_params)
    redirect_to '/gyms'
  end

  private
    def gym_params
      params.permit(:name, :location, :has_rope, :square_feet)
    end
end
