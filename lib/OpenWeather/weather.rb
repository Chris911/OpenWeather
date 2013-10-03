module OpenWeather
  module Weather
    def weather_raw(city)
      get('/weather', query: { q: city, units: @units_format, mode: @data_format })
    end
  end
end