module OpenWeather
  module Weather
    def weather_raw(city)
      get('/weather', query: { q: city, units: @units_format, mode: @data_format })
    end

    def weather_min(city)
      weather = weather_raw(city)
      weather['main']['temp_min']
    end

    def weather_max(city)
      weather = weather_raw(city)
      weather['main']['temp_max']
    end
  end
end