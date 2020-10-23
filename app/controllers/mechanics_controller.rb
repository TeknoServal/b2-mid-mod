class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all.order(experience: :desc)
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def add_ride
    ride = Ride.where('name = ?', params[:new_ride])
    mechanic = Mechanic.find(params[:id])

    mechanic.rides << ride

    redirect_to "/mechanics/#{mechanic.id}"
  end
end
