require 'rails_helper'

RSpec.describe 'Mechanic Index Page' do
  before :each do
    Mechanic.destroy_all
    @mechanic1 = Mechanic.create(name: 'Joe Bob', years_of_experience: 10)
    @mechanic2 = Mechanic.create(name: 'Kara Smith', years_of_experience: 7)
  end

  describe "As a user," do
    describe "When I visit the mechanics index page" do
      it "I see a header saying 'All Mechanics'" do
        visit '/mechanics'
        expect(page).to have_content("All Mechanics")
      end
      it "And I see a list of all mechanic’s names and their years of experience" do
        visit '/mechanics'
        expect(page).to have_content("#{@mechanic1.name}")
        expect(page).to have_content("#{@mechanic1.years_of_experience}")
        expect(page).to have_content("#{@mechanic2.name}")
        expect(page).to have_content("#{@mechanic1.years_of_experience}")
      end
      it "And I see the average years of experience across all mechanics" do
        visit '/mechanics'
        expect(page).to have_content("Average Years of Experience: 8.5")
      end
    end
  end
end
