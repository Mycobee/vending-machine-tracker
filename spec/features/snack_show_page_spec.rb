require 'rails_helper'

RSpec.describe 'When a user visits a snack show page' do
    context 'They see the attributes of the snack' do
        it 'shows the snack name' do
            owner = Owner.create(name: "Sam's Snacks")
            dons  = owner.machines.create(location: "Don's Mixed Drinks")
            snack_1 = dons.snacks.create(name: "good snack", price: 2.50)
            snack_2 = dons.snacks.create(name: "even better snack", price: 3.50)
            visit snack_path(snack_1)

            expect(page).to have_content(snack_1.name)
        end


        it 'shows the price' do
            owner = Owner.create(name: "Sam's Snacks")
            dons  = owner.machines.create(location: "Don's Mixed Drinks")
            snack_1 = dons.snacks.create(name: "good snack", price: 2.50)
            snack_2 = dons.snacks.create(name: "even better snack", price: 3.50)
            visit snack_path(snack_1)

            expect(page).to have_content(snack_1.price)
        end

        it 'shows location list' do
            owner = Owner.create(name: "Sam's Snacks")
            dons  = owner.machines.create(location: "Don's Mixed Drinks")
            snack_1 = dons.snacks.create(name: "good snack", price: 2.50)
            snack_2 = dons.snacks.create(name: "even better snack", price: 3.50)
            visit snack_path(snack_1)

            expect(page).to have_content(dons.location)
        end

        it 'shows count of item types in machine' do
            owner = Owner.create(name: "Sam's Snacks")
            dons  = owner.machines.create(location: "Don's Mixed Drinks")
            snack_1 = dons.snacks.create(name: "good snack", price: 2.50)
            snack_2 = dons.snacks.create(name: "even better snack", price: 3.50)
            visit snack_path(snack_1)

            expect(page).to have_content(1)
        end
    end
end