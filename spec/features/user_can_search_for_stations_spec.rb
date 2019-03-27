require 'rails_helper'

describe 'as a User' do
  it 'can search for stations' do
    visit '/'

    fill_in :q, with: 80206

    click_on "Locate"

    expect(current_path).to eq("/search")

    expect(page).to have_css("#Stations")

    within "#Stations" do
      expect(page).to have_css(".station", count: 15)
      within (all(".station").first) do
        expect(page).to have_content("Name: PUBLIC STATIONS")
        expect(page).to have_content("Address: 2951-2985 E 3rd Ave")
        expect(page).to have_content("Fuel Types: ELEC")
        expect(page).to have_content("Distance: 0.62888")
        expect(page).to have_content("Access Times: 24 hours dailyq")
      end
    end
  end
end

# Then I should see a list of the 15 closest stations within 5 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And the stations should only be public, and not private, planned or temporarily unavailable.
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
