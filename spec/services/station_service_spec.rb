require 'rails_helper'

describe StationService do
  it 'exists' do
    zip_code = 80206

    station_service = StationService.new(zip_code)

    expect(station_service).to be_a(StationService)
  end
end
