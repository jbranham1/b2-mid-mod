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
end
