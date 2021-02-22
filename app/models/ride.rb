class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  validates :name, presence: true, uniqueness:true
end
