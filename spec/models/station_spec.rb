require 'rails_helper'

RSpec.describe Station, type: :model do
  before :each do
    attributes = {:access_code=>"public",
                  :access_days_time=>"24 hours daily",
                  :fuel_type_code=>"ELEC",
                  :station_name=>"PUBLIC STATIONS",
                  :street_address=>"2951-2985 E 3rd Ave",
                  :distance=>0.62888,
                  }
    @station = Station.new(attributes)
  end

  it 'exists' do
    expect(@station).to be_a(Station)
  end

  it 'has attributes' do
    expect(@station.name).to eq("PUBLIC STATIONS")
    expect(@station.address).to eq("2951-2985 E 3rd Ave")
    expect(@station.fuel_types).to eq("ELEC")
    expect(@station.distance).to eq(0.62888)
    expect(@station.access_times).to eq("24 hours daily")
  end


end
