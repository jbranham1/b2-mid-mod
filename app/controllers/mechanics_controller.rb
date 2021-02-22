class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def self.average_experience
    average(:years_of_experience)
  end
end
