require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:mechanics).through(:mechanic_rides) }
    it {should belong_to :park}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
