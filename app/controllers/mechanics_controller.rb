class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all.order(experience: :desc)
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end
end
