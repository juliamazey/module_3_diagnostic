class StationsFacade
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    response = service.get_stations
    response.map do |station_data|
      Station.new(station_data)
    end
  end

  def service
    StationService.new(@zip_code)
  end

end
