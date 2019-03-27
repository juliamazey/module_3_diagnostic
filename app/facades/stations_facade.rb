class StationsFacade
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    response = service.get_stations
  end

  def service
    StationService.new(@zip_code)
  end

end
