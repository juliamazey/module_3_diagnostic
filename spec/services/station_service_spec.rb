require 'rails_helper'

describe StationService do
  before :each do
    @zip_code = 80206
    @station_service = StationService.new(@zip_code)
  end

  it 'exists' do
    expect(@station_service).to be_a(StationService)
  end

  it '.get_stations' do
    stations = @station_service.get_stations

    expect(stations.count).to eq(15)
    station = stations[1]

    expect(station[:station_name]).to eq("9&CO")
    expect(station[:street_address]).to eq("4040-4110 E 11th Ave")
    expect(station[:fuel_type_code]).to eq("ELEC")
    expect(station[:distance]).to eq(0.67412)
    expect(station[:access_days_time]).to eq("24 hours daily")
  end
end
