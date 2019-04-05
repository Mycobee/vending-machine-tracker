require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :snacks }
  end

  describe 'methods' do
    it '.average_price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1 = dons.snacks.create(name: "good snack", price: 2.50)
      snack_2 = dons.snacks.create(name: "even better snack", price: 3.50)

      expect(dons.average_price).to eq(3)
    end
  end
end
