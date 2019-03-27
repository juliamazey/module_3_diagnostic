class StationService

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def get_stations
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def response
    query_params = "location=#{@zip_code}&fuel_type=ELEC,LPG&limit=15&api_key=#{ENV['API_KEY']}&format=JSON&radius=5.0&access=public&status=E"
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?#{query_params}")
  end

  def conn
    Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

end
