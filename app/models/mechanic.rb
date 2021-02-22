class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  validates :name, presence: true, uniqueness: true

  def self.average_experience
    average(:years_of_experience)
  end
end
