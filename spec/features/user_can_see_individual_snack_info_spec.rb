require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    sam = Owner.create(name: "Sam's Snacks")

    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine_2 = sam.machines.create(location: "Bonanza")
    machine_3 = sam.machines.create(location: "Crazy Town")

    snack_1 = Snack.create(name: "Airheads", price: 50.00)
    snack_2 = Snack.create(name: "Twizzlers", price: 36.00)
    snack_3 = Snack.create(name: "Beef Jerky", price: 75.00)

    MachineSnack.create(snack: snack_1, machine: machine_1)
    MachineSnack.create(snack: snack_2, machine: machine_1)
    MachineSnack.create(snack: snack_1, machine: machine_2)
    MachineSnack.create(snack: snack_1, machine: machine_3)
    MachineSnack.create(snack: snack_2, machine: machine_2)
    MachineSnack.create(snack: snack_2, machine: machine_2)
    MachineSnack.create(snack: snack_3, machine: machine_1)

    visit snack_path(snack_1)

    expect(page).to have_content("Airheads")
    expect(page).to have_content("50.0")
    expect(page).to have_content("Crazy Town")
    expect(page).to have_content("Airheads")
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("4")
  end
end
