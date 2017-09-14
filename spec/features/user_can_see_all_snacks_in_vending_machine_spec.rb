require 'rails_helper'

feature "When a user visits the vending machine index" do
  scenario "they see a list of vending machine locations" do
    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")

    machine_1.snacks.create(name: "Doritos", price: 45.00)
    machine_1.snacks.create(name: "Twizzlers", price: 36.00)

# require 'pry'; binding.pry
    visit owner_machine_path(sam, machine_1)

    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Doritos")
    expect(page).to have_content("36.0")
    expect(page).to have_content("40")
  end
end
