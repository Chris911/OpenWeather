module OpenWeather
  module Weather
    def weather_raw(city)
      @city_file.nil? ?
          get('/weather', query: {q: city, units: @units_format, mode: @data_format}) :
          JSON.parse(File.read(@city_file))
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