require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  before :each do
    Mechanic.destroy_all
    Ride.destroy_all
    MechanicRide.destroy_all
    Park.destroy_all
    @mechanic1 = Mechanic.create(name: 'Joe Bob', years_of_experience: 10)
    @mechanic2 = Mechanic.create(name: 'Kara Smith', years_of_experience: 7)
    @park1 = Park.create(name: 'Park 1', ticket_price: 50)
    @park2 = Park.create(name: 'Park 2', ticket_price: 50)
    @ride1 = Ride.create(name: 'The Frog Hopper', thrill_rating: 2, open: true, park_id: @park1.id)
    @ride2 = Ride.create(name: 'Fahrenheit', thrill_rating: 5, open: false, park_id: @park1.id)
    @ride3 = Ride.create(name: 'Ride', thrill_rating: 3, open: true, park_id: @park2.id)
    @ride4 = Ride.create(id: 4, name: 'The Kiss Raise', thrill_rating: 3, open: true, park_id: @park2.id)
    @mechanic_ride1 = MechanicRide.create(mechanic_id: @mechanic1.id, ride_id: @ride1.id)
    @mechanic_ride2 = MechanicRide.create(mechanic_id: @mechanic1.id, ride_id: @ride2.id)
    @mechanic_ride3 = MechanicRide.create(mechanic_id: @mechanic1.id, ride_id: @ride3.id)
  end

  describe "As a user," do
    describe "When I go to a mechanics show page" do
      it "I see the mechanic name and years of experience" do
        visit "/mechanics/#{@mechanic1.id}"
        expect(page).to have_content("#{@mechanic1.name}")
        expect(page).to have_content("#{@mechanic1.years_of_experience}")
        expect(page).to_not have_content("#{@mechanic2.name}")
        expect(page).to_not have_content("#{@mechanic2.years_of_experience}")
      end

      it "I see all the rides associated with the mechanic that are open" do
        visit "/mechanics/#{@mechanic1.id}"
        within ".rides" do
          expect(page).to have_content("Current rides they’re working on:")
          expect(page).to have_content(@ride1.name)
          expect(page).to_not have_content(@ride2.name)
          expect(page).to have_content(@ride3.name)
        end
      end

      it "I see all the rides associated with the mechanic listed by thrill rating in descending order" do
        visit "/mechanics/#{@mechanic1.id}"
        within ".rides" do
          expect(page).to have_content("Current rides they’re working on:")
          expect(page).to have_content(@ride1.name)
          expect(page).to have_content(@ride3.name)
          expect(@ride3.name).to appear_before(@ride1.name)
        end
      end

      describe "I see a form to add a ride to their workload" do
        describe "When I fill in that field with an id of an existing ride and hit submit" do
          it "I’m taken back to that mechanic's show page and I see the name of that newly added ride on this mechanics show page" do
            visit "/mechanics/#{@mechanic1.id}"
            expect(page).to have_content("Add a ride to workload:")
            within ".new-ride" do
              fill_in 'ride_id', with: 4
              expect(page).to have_button("Submit")
              click_on 'Submit'
            end

            expect(current_path).to eq("/mechanics/#{@mechanic1.id}")

            expect(page).to have_content(@ride4.name)
          end
        end
      end
    end
  end
end
