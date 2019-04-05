class Machine < ApplicationRecord
  validates_presence_of :location
  
  belongs_to :owner
  has_many :snacks

  def average_price
    total = 0
    snacks.each do |snack|
      total += snack.price
    end
    total / snacks.count
  end
end
