require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe 'class methods' do
    describe "::average_experience" do
      it "returns average experience of all mechanics" do
        mechanic1 = Mechanic.create(name: 'Joe Bob', years_of_experience: 10)
        mechanic2 = Mechanic.create(name: 'Kara Smith', years_of_experience: 7)
        expect(Mechanic.average_experience).to eq(8.5)
      end
    end
  end
  describe 'instance methods' do
    describe "::open_rides" do
      it "returns all rides for mechanic that are open and in descending order of thrill rating" do
        mechanic1 = Mechanic.create(name: 'Joe Bob', years_of_experience: 10)
        ride1 = Ride.create(name: 'The Frog Hopper', thrill_rating: 2, open: true)
        ride2 = Ride.create(name: 'Fahrenheit', thrill_rating: 5, open: false)
        ride3 = Ride.create(name: 'Ride', thrill_rating: 3, open: true)
        mechanic_ride1 = MechanicRide.create(mechanic_id: mechanic1.id, ride_id: ride1.id)
        mechanic_ride2 = MechanicRide.create(mechanic_id: mechanic1.id, ride_id: ride2.id)
        mechanic_ride3 = MechanicRide.create(mechanic_id: mechanic1.id, ride_id: ride3.id)
        expect(mechanic1.open_rides.pluck(:name)).to eq(["Ride", "The Frog Hopper"])
      end
    end
  end
end
