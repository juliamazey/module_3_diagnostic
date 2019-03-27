require 'rails_helper'

describe StationsFacade do
  it 'exists' do

    zip_code = 80206

    stations_facade = StationsFacade.new(zip_code)

    expect(stations_facade).to be_a(StationsFacade)
  end
end
