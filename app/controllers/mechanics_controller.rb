class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all.order(experience: :desc)
  end
end
