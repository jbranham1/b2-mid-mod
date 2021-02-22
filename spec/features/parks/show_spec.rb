require 'rails_helper'

RSpec.describe 'Park Show Page' do
  before :each do
    Park.destroy_all
    Ride.destroy_all
    @park1 = Park.create(name: 'Park 1', ticket_price: 50)
    @park2 = Park.create(name: 'Park 2', ticket_price: 25)
    @ride1 = Ride.create(name: 'The Frog Hopper', thrill_rating: 2, open: true, park_id: @park1.id)
    @ride2 = Ride.create(name: 'Fahrenheit', thrill_rating: 5, open: false, park_id: @park1.id)
    @ride3 = Ride.create(name: 'Ride', thrill_rating: 3, open: true, park_id: @park2.id)
    @ride4 = Ride.create(id: 4, name: 'The Kiss Raise', thrill_rating: 3, open: true, park_id: @park2.id)
  end

  describe "As a visitor," do
    describe "When I visit an amusement park’s show page" do
      it "I see the name and price of admissions for that amusement park" do
        visit "/parks/#{@park1.id}"
        expect(page).to have_content("#{@park1.name}")
        expect(page).to have_content("Admissions: #{@park1.ticket_price_to_dollar}")
        expect(page).to_not have_content("#{@park2.name}")
        expect(page).to_not have_content("#{@park2.ticket_price}")
      end

      it "And I see the names of all the rides that are at that theme park listed in alphabetical order" do
        visit "/parks/#{@park1.id}"

        expect(page).to have_content("Rides:")
        within ".rides" do
          expect(page).to have_content(@ride1.name)
          expect(page).to have_content(@ride2.name)
          expect(@ride2.name).to appear_before(@ride1.name)
      end
      end

      it "And I see the average thrill rating of this amusement park’s rides" do
        visit "/parks/#{@park1.id}"
        within ".thrill-rating" do
          expect(page).to have_content("Average Thrill Rating of Rides: #{@park1.average_thrill_rating}/10")
        end
      end
    end
  end
end
