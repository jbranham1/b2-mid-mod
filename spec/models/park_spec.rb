require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'relationships' do
    it { should have_many :rides }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe 'instance methods' do
    describe "#rides_alphabetically" do
      it "returns all rides for that park alphabetically" do
        park1 = Park.create(name: 'Park 1', ticket_price: 50)
        ride1 = Ride.create(name: 'The Frog Hopper', thrill_rating: 2, open: true, park_id: park1.id)
        ride2 = Ride.create(name: 'Fahrenheit', thrill_rating: 5, open: false, park_id: park1.id)
        ride3 = Ride.create(name: 'Ride', thrill_rating: 3, open: true, park_id: park1.id)
        expect(park1.rides_alphabetically.pluck(:name)).to eq(["Fahrenheit", "Ride", "The Frog Hopper"])
      end
    end
    describe "#ticket_price_to_dollar" do
      it "returns ticket price in dollar format" do
        park1 = Park.create(name: 'Park 1', ticket_price: 50)
        expect(park1.ticket_price_to_dollar).to eq("$50.00")
      end
    end
    describe "#average_thrill_rating" do
      it "returns average thrill rating for all rides at the park" do
        park1 = Park.create(name: 'Park 1', ticket_price: 50)
        ride1 = Ride.create(name: 'The Frog Hopper', thrill_rating: 4, open: true, park_id: park1.id)
        ride2 = Ride.create(name: 'Fahrenheit', thrill_rating: 5, open: false, park_id: park1.id)
        ride3 = Ride.create(name: 'Ride', thrill_rating: 3, open: true, park_id: park1.id)
        expect(park1.average_thrill_rating.to_f).to eq(4.0)
      end
    end
  end
end
