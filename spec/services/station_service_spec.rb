require 'rails_helper'

describe StationService do

  it 'exists' do
    zip_code = 80206
    station_service = StationService.new(zip_code)
    expect(station_service).to be_a(StationService)
  end

  it '.get_stations' do
    zip_code = 80206
    station_service = StationService.new(zip_code)

    json_response = File.open('./fixtures/stations.json')
    query_params = "location=#{zip_code}&fuel_type=ELEC,LPG&limit=15&api_key=#{ENV['API_KEY']}&format=JSON&radius=5.0&access=public&status=E"
    mock = stub_request(:get, "/api/alt-fuel-stations/v1/nearest.json?#{query_params}")
        .to_return(status: 200, body: json_response)

    to_ruby = JSON.parse(mock.response.body, symbolize_names: true)[:fuel_stations]

    expect(to_ruby.count).to eq(15)
    station = to_ruby[1]

    expect(station[:station_name]).to eq("9&CO")
    expect(station[:street_address]).to eq("4040-4110 E 11th Ave")
    expect(station[:fuel_type_code]).to eq("ELEC")
    expect(station[:distance]).to eq(0.67412)
    expect(station[:access_days_time]).to eq("24 hours daily")
  end
end
