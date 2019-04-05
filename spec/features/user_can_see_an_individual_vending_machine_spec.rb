require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: "good snack", price: 2.50)
    snack_2 = dons.snacks.create(name: "even better snack", price: 3.50)
    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

 it 'they see a list of all snacks names in that machine and average price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: "good snack", price: 2.50)
    snack_2 = dons.snacks.create(name: "even better snack", price: 3.50)
    visit machine_path(dons)
    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content(dons.average_price)
  end
end
