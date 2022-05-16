class GymsController < ApplicationController
  def index
    @gyms = Gym.all
    @gyms = Gym.order_by_creation
  end

  def show
    @gym = Gym.find(params[:id])
  end
end
