class Park < ApplicationRecord
  has_many :rides
  validates :name, presence: true, uniqueness:true

  def rides_alphabetically
    rides.order(:name)
  end

  def ticket_price_to_dollar
    "$" + sprintf("%.2f", ticket_price)
  end

  def average_thrill_rating
    rides.average(:thrill_rating)
  end
end
