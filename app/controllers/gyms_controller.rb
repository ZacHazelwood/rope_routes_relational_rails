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

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    update_gym = Gym.find(params[:id])
    update_gym.update(gym_params)
    update_gym.save
    redirect_to "/gyms/#{params[:id]}"
  end

  private
    def gym_params
      params.permit(:name, :location, :has_rope, :square_feet)
    end
end
